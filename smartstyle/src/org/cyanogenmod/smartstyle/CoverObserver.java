/*
 * Copyright (c) 2016 The CyanogenMod Project
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 * Also add information on how to contact you by electronic and paper mail.
 *
 */

package org.cyanogenmod.smartstyle;

import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Handler;
import android.os.PowerManager;
import android.os.SystemClock;
import android.os.UEventObserver;
import android.provider.Settings;
import android.util.Log;

class CoverObserver extends UEventObserver {
    private static final String COVER_UEVENT_MATCH = "DEVPATH=/devices/virtual/input/clearpad/cover_status";

    private static final String TAG = "SmartStyle";

    private final Context mContext;
    private final IntentFilter mFilter = new IntentFilter();
    private PowerManager mPowerManager;

    private int mSwitchState = 0;

    public CoverObserver(Context context) {
        mContext = context;
        PowerManager pm = (PowerManager)context.getSystemService(Context.POWER_SERVICE);
    }

    public synchronized final void init() {
        mFilter.addAction(Intent.ACTION_SCREEN_ON);
        mPowerManager = (PowerManager) mContext.getSystemService(Context.POWER_SERVICE);
        startObserving(COVER_UEVENT_MATCH);
    }

    @Override
    public void onUEvent(UEventObserver.UEvent event) {
        try {
            mSwitchState = Integer.parseInt(event.get("SWITCH_STATE"));
            boolean screenOn = mPowerManager.isScreenOn();

            if (mSwitchState == 1) {
                if (screenOn) {
                    mPowerManager.goToSleep(SystemClock.uptimeMillis());
                }
            } else {
                if (!screenOn) {
                    mPowerManager.wakeUp(SystemClock.uptimeMillis());
                }
            }
        } catch (NumberFormatException e) {
            Log.e(TAG, "Error parsing SWITCH_STATE event", e);
        }
    }
}
