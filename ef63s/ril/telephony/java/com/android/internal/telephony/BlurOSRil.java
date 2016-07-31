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

import android.os.Message;
import android.content.Context;
import android.os.SystemProperties;
import android.telephony.Rlog;
import android.os.SystemService;
import android.os.Parcel;

public class BlurOSRil extends RIL {
    private Message mPendingGetSimStatus;
    private int regfail_cont = 0x0;
    
    public BlurOSRil(Context context, int preferredNetworkType, int cdmaSubscription, Integer instanceId) {
        this(context, preferredNetworkType, cdmaSubscription);
        mQANElements = SystemProperties.getInt("ro.ril.telephony.mqanelements", 0x4);
    }
    
    public BlurOSRil(Context context, int networkMode, int cdmaSubscription) {
        super(context, networkMode, cdmaSubscription, 0x0);
        mQANElements = SystemProperties.getInt("ro.ril.telephony.mqanelements", 0x4);
    }
    
    @Override
    protected Object
    responseFailCause(Parcel p) {
        int numInts;
        int response[];

        numInts = p.readInt();
        response = new int[numInts];
        for (int i = 0 ; i < numInts ; i++) {
            response[i] = p.readInt();
        }
        LastCallFailCause failCause = new LastCallFailCause();
        failCause.causeCode = response[0];
        if (p.dataAvail() > 0) {
          failCause.vendorCause = p.readString();
        }
        return failCause;
        
    }
        
    private static void shSleep(int value) {
        try {
            Thread.sleep((long)value);
            return;
        } catch(InterruptedException localInterruptedException1) {
        }
    }
    
    private void restartRild() {
        Rlog.d("SHRILGET: ", "reset RIL!");
        setRadioState(CommandsInterface.RadioState.RADIO_UNAVAILABLE);
        SystemService.stop("ril-daemon");
        RILRequest.resetSerial();
        clearRequestList(0x1, false);
        SystemService.start("ril-daemon");
        shSleep(0x1f4);
    }
    
    public void getIccCardStatus(Message result) {
        if(mState != CommandsInterface.RadioState.RADIO_ON) {
            regfail_cont = (regfail_cont + 0x1);
            shSleep(0x1f4);
            if((regfail_cont >= 0x2) && (mState != CommandsInterface.RadioState.RADIO_ON)) {
                Rlog.d("SHRILGET: ", "regfail count is too much! [2]");
                regfail_cont = 0x0;
                restartRild();
                return;
            }
            mPendingGetSimStatus = result;
            Rlog.d("SHRILGET: ", "NO RADIO ON! PendingGetSimStatus: " + result + "regfail: " + regfail_cont);
            return;
        }
        super.getIccCardStatus(result);
        Rlog.d("SHRILGET: ", "RADIO ON, PendingGetSimStatus: " + result + "regfail: " + regfail_cont);
    }
    
    protected void switchToRadioState(CommandsInterface.RadioState newState) {
        super.switchToRadioState(newState);
        Rlog.d("SHRILGET: ", "switchToRadioState EXED ");
        if((newState == CommandsInterface.RadioState.RADIO_ON) && (mPendingGetSimStatus != null)) {
            Rlog.d("SHRILGET: ", "newState GET");
            super.getIccCardStatus(mPendingGetSimStatus);
            mPendingGetSimStatus = null;
        }
    }
}
