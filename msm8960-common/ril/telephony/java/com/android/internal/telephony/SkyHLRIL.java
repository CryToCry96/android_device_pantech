/*
 * Copyright (C) 2014 The CyanogenMod Project
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
import android.os.Parcel;
import android.os.Message;
import android.os.SystemProperties;
import android.util.Log;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;

/**
 * Custom Qualcomm RIL for Pantech msm8960
 *
 * {@hide}
 */
public class SkyHLRIL extends RIL implements CommandsInterface {
    
    private boolean dataRebooted = false;

    public SkyHLRIL(Context context, int networkMode, int cdmaSubscription) {
        this(context, networkMode, cdmaSubscription, null);
    }

    public SkyHLRIL(Context context, int preferredNetworkType,
            int cdmaSubscription, Integer instanceId) {
        super(context, preferredNetworkType, cdmaSubscription, instanceId);
    }

    @Override
     public void getRadioCapability(Message response) {
         riljLog("getRadioCapability: returning static radio capability");
         if (response != null) {
             Object ret = makeStaticRadioCapability();
             AsyncResult.forMessage(response, ret, null);
             response.sendToTarget();
         }
     }
    
    @Override
     public void setPreferredNetworkType(int networkType , Message response) {
         riljLog("setPreferredNetworkType: " + networkType);
 
         if (!dataRebooted) {
             riljLog("Reset radio!");
             setRadioPower(false, null);
             dataRebooted = true;
        }
 
         super.setPreferredNetworkType(networkType, response);
    }
}
