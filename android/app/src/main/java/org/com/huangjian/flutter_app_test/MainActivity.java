package org.com.huangjian.flutter_app_test;

import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build;
import android.os.Bundle;
import android.widget.Toast;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

    private static final String CHANNEL_BATTERY = "samples.flutter.io/battery";
    private static final String CHANNEL_TOAST = "samples.flutter.io/toast";


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
        new MethodChannel(getFlutterView(), CHANNEL_BATTERY).setMethodCallHandler((call, result) -> {
            if (call.method.equals("getBatteryLevel")) {
                int batteryLevel = getBatteryLevel();
                if (batteryLevel != -1) {
                    result.success(batteryLevel);
                } else {
                    result.error("UNAVAILABLE", "Battery level not available.", null);
                }
            } else {
                result.notImplemented();
            }
        });
        new MethodChannel(getFlutterView(), CHANNEL_TOAST).setMethodCallHandler((call, result) -> {
            if (call.method.equals("showToast")) {
                showToast();
            }
        });
    }

    //通过Android原生代码进行提示Toast
    private void showToast() {
        Toast.makeText(this, "来自Android原生代码中的Toast", Toast.LENGTH_LONG).show();
    }


    //获取电池电量的android原生方法
    private int getBatteryLevel() {
        int batteryLevel = -1;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            BatteryManager batteryManager = (BatteryManager) getSystemService(BATTERY_SERVICE);
            batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
        } else {
            Intent intent = new ContextWrapper(getApplicationContext()).
                    registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
            batteryLevel = (intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100) /
                    intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
        }
        return batteryLevel;
    }
}
