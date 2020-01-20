/*
 * Copyright (c) 2015 The CyanogenMod Project
 * Copyright (c) 2017 The LineageOS Project
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

package org.lineageos.settings.device.actions;

import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.util.Log;

import org.lineageos.settings.device.LineageActionsSettings;
import org.lineageos.settings.device.ScreenStateNotifier;
import org.lineageos.settings.device.SensorHelper;

public class CameraActivationSensor implements SensorEventListener, UpdatedStateNotifier, ScreenStateNotifier {
    private static final String TAG = "LineageActions-CameraSensor";

    private final LineageActionsSettings mLineageActionsSettings;
    private final SensorHelper mSensorHelper;

    private final Sensor mSensor;
    private final Sensor mStowSensor;

    private boolean mIsEnabled;
    private boolean mIsStowed;
    private boolean mStowedEnabled;

    public CameraActivationSensor(LineageActionsSettings lineageActionsSettings, SensorHelper sensorHelper) {
        mLineageActionsSettings = lineageActionsSettings;
        mSensorHelper = sensorHelper;
        mSensor = sensorHelper.getCameraActivationSensor();
        mStowSensor = sensorHelper.getStowSensor();
    }

    @Override
    public synchronized void updateState() {
        if (mLineageActionsSettings.isCameraGestureEnabled() && !mIsEnabled) {
            Log.d(TAG, "Enabling");
            mSensorHelper.registerListener(mSensor, this);
            mIsEnabled = true;
        } else if (! mLineageActionsSettings.isCameraGestureEnabled() && mIsEnabled) {
            Log.d(TAG, "Disabling");
            mSensorHelper.unregisterListener(this);
            mIsEnabled = false;
        }
    }

    @Override
    public void screenTurnedOn() {
        if (mStowedEnabled) {
            Log.d(TAG, "Disabling Stowed Sensor");
            mSensorHelper.unregisterListener(mStowListener);
            mStowedEnabled = false;
        }
        mIsStowed = false;
    }

    @Override
    public void screenTurnedOff() {
        if (mLineageActionsSettings.isCameraGestureEnabled() && !mStowedEnabled) {
            Log.d(TAG, "Enabling Stowed Sensor");
            mSensorHelper.registerListener(mStowSensor, mStowListener);
            mStowedEnabled = true;
        }
    }

    @Override
    public void onSensorChanged(SensorEvent event) {
        Log.d(TAG, "activate camera");
        if (mIsStowed && mStowedEnabled) {
            Log.d(TAG, "phone is stowed, ignoring camera action");
            return;
        }
        mLineageActionsSettings.cameraAction();
    }

    @Override
    public void onAccuracyChanged(Sensor sensor, int accuracy) {
    }

    private SensorEventListener mStowListener = new SensorEventListener() {
        @Override
        public synchronized void onSensorChanged(SensorEvent event) {
            mIsStowed = (event.values[0] != 0);
        }

        @Override
        public void onAccuracyChanged(Sensor mSensor, int accuracy) {
        }
    };
}
