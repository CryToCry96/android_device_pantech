/*
 * Copyright (C) 2012 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.android.internal.telephony;

import static com.android.internal.telephony.RILConstants.*;

import android.content.Context;
import android.os.AsyncResult;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.os.Parcel;
import android.telephony.SmsMessage;
import android.os.SystemProperties;
import android.os.SystemService;
import android.telephony.SignalStrength;
import android.text.TextUtils;
import android.util.Log;
import android.telephony.Rlog;
import android.provider.Settings;

import com.android.internal.telephony.RILConstants;

import java.util.ArrayList;

import com.android.internal.telephony.cdma.CdmaSmsBroadcastConfigInfo;

/**
 * Custom Sky Pantech IM-A870 RIL
 *
 * {@hide}
 */
public class SkyHLRIL extends RIL implements CommandsInterface {
    static final String LOG_TAG = "SkyHLRIL";

    private Message mPendingGetSimStatus;

    private int rCheck = 0;
    private int minRCheck = 2;

    public SkyHLRIL(Context context, int networkMode, int cdmaSubscription) {
        this(context, networkMode, cdmaSubscription, null);
    }

    public SkyHLRIL(Context context, int preferredNetworkType,
            int cdmaSubscription, Integer instanceId) {
        super(context, preferredNetworkType, cdmaSubscription, instanceId);
	minRCheck = 2;
    }

    private static void hlSleep(int value) {
    try {
            Thread.sleep(value);
        } catch (InterruptedException ie) {}
    }


    // Hack for Lollipop
    // The system now queries for SIM status before radio on, resulting
    // in getting an APPSTATE_DETECTED state. The RIL does not send an
    // RIL_UNSOL_RESPONSE_SIM_STATUS_CHANGED message after the SIM is
    // initialized, so delay the message until the radio is on.
    @Override
    public void
    getIccCardStatus(Message result) {
        if (mState != RadioState.RADIO_ON) {
	    rCheck += 1;
            mPendingGetSimStatus = result;
	    hlSleep(500);
	if ((mState != RadioState.RADIO_ON) && (rCheck >= minRCheck)) {
            Log.d(LOG_TAG, "restartRild started");
        setRadioState(RadioState.RADIO_UNAVAILABLE);
        SystemService.stop("ril-daemon");
        RILRequest.resetSerial();
        clearRequestList(RADIO_NOT_AVAILABLE, false);
        SystemService.start("ril-daemon");
	SystemProperties.set("ro.telephony.socket.reset", "1");
        hlSleep(500);
            Log.d(LOG_TAG, "Active radio");
        setRadioState(RadioState.RADIO_ON);
		rCheck = 0;
	}
        } else {
            super.getIccCardStatus(result);
        }
    }

    public void checkSoftReboot() {
	if ((SystemProperties.get("gsm.sim.state").equals("NOT_READY")) && (mState == RadioState.RADIO_ON)){
		hlSleep(5000);
		SystemService.restart("ril-daemon");
	}
    }
		

    @Override
    protected void switchToRadioState(RadioState newState) {
        super.switchToRadioState(newState);

        if (newState == RadioState.RADIO_ON && mPendingGetSimStatus != null) {
            super.getIccCardStatus(mPendingGetSimStatus);
            mPendingGetSimStatus = null;
	}
    }

	/** From stock RIL:
	 *-----------------------------------
	 *	OperatorInfo :
	 *		this.operatorAlphaLong = paramString1;
	 *		this.operatorAlphaShort = paramString2;
	 *		this.operatorNumeric = paramString3;
	 *		this.state = paramState;
	 *		this.rat = paramRadioAccessTechnology;
	 */
	@Override
	protected Object responseOperatorInfos(Parcel p) {
		String[] strings = (String[]) responseStrings(p);
		if (strings.length % 5 != 0)
			throw new RuntimeException(
					"RIL_REQUEST_QUERY_AVAILABLE_NETWORKS: invalid response. Got "
							+ strings.length
							+ " strings, expected multible of 5");
		ArrayList ret = new ArrayList(strings.length / 5);

		for (int i = 0 ; i < strings.length ; i += 5) {
			riljLog("responseOperatorInfos plmn = " + strings[(i + 0)]);
			if ((strings[(i + 0)] != null)
					&& !TextUtils.isEmpty(strings[(i + 0)])) {

				riljLog("responseOperatorInfos number = "
						+ strings[(i + 2)]);
				riljLog("responseOperatorInfos RadioAccessTechnology = "
						+ strings[(i + 3)]);

				ret.add(new OperatorInfo(
						/*getPLMN(strings[(i + 2)]),*/
						/* here we use plmn directory */
						strings[(i + 0)] + ", " + strings[(i + 3)],
						strings[(i + 1)], 
						strings[(i + 2)],
						strings[(i + 4)]/*, RadioAccessTechnology:
						strings[(i + 3)]*/));
			}
		}

		return ret;
	}
	
    private void
    setNetworkSelectionMode(String operatorNumeric, Message response) {
        RILRequest rr;

        if (operatorNumeric == null)
            rr = RILRequest.obtain(RIL_REQUEST_SET_NETWORK_SELECTION_AUTOMATIC, response);
        else
            rr = RILRequest.obtain(RIL_REQUEST_SET_NETWORK_SELECTION_MANUAL, response);

        rr.mParcel.writeString(operatorNumeric);
        rr.mParcel.writeInt(-1);

        send(rr);
    }

    private void
    handleUnsupportedRequest(Message response) {
        if (response != null) {
            CommandException ex = new CommandException(
                CommandException.Error.REQUEST_NOT_SUPPORTED);
            AsyncResult.forMessage(response, null, ex);
            response.sendToTarget();
        }
    }

    @Override
    public void
    dial(String address, int clirMode, UUSInfo uusInfo, Message result) {
        RILRequest rr = RILRequest.obtain(RIL_REQUEST_DIAL, result);

        rr.mParcel.writeString(address);
        rr.mParcel.writeInt(clirMode);

        if (uusInfo == null) {
            rr.mParcel.writeInt(0); // UUS information is absent
        } else {
            rr.mParcel.writeInt(1); // UUS information is present
            rr.mParcel.writeInt(uusInfo.getType());
            rr.mParcel.writeInt(uusInfo.getDcs());
            rr.mParcel.writeByteArray(uusInfo.getUserData());
        }
        rr.mParcel.writeInt(255);

        if (RILJ_LOGD) riljLog(rr.serialString() + "> " + requestToString(rr.mRequest));

        send(rr);
    }

    @Override
    public void
    setNetworkSelectionModeAutomatic(Message response) {
        setNetworkSelectionMode(null, response);
    }

    @Override
    public void
    setNetworkSelectionModeManual(String operatorNumeric, Message response) {
        setNetworkSelectionMode(operatorNumeric, response);
    }

    @Override
    public void getRadioCapability(Message response) {
        Rlog.i(LOG_TAG, "RIL_REQUEST_GET_RADIO_CAPABILITY is not supported");
        handleUnsupportedRequest(response);
    }

    @Override
    public void setCdmaBroadcastConfig(CdmaSmsBroadcastConfigInfo[] configs, Message response) {
        Rlog.i(LOG_TAG, "RIL_REQUEST_CDMA_SET_BROADCAST_CONFIG is not supported");
        handleUnsupportedRequest(response);
    }

    /**
     * {@inheritDoc}
     */

    public void setDataAllowed(boolean allowed, Message result) {
        Rlog.i(LOG_TAG, "RIL_REQUEST_ALLOW_DATA is not supported");
        handleUnsupportedRequest(result);
    }

    @Override
    public void startLceService(int reportIntervalMs, boolean pullMode, Message response) {
        Rlog.i(LOG_TAG, "RIL_REQUEST_START_LCE is not supported");
        handleUnsupportedRequest(response);
    }

    // This call causes ril to crash the socket, stopping further communication
    @Override
    public void
    getHardwareConfig (Message result) {
        riljLog("Ignoring call to 'getHardwareConfig'");
        if (result != null) {
            CommandException ex = new CommandException(
                CommandException.Error.REQUEST_NOT_SUPPORTED);
            AsyncResult.forMessage(result, null, ex);
            result.sendToTarget();
        }
    }

}
