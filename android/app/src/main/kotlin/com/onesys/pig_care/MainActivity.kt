package com.onesys.pig_care

import android.content.Intent
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.onesys.pigcare"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            if (call.method == "openThermalCamera") {
                // start thermal Activity
                startActivity(Intent(this, ThermalCameraActivity::class.java))
//                Intent(this, DisplayMessageActivity::class.java)
            } else {
                result.notImplemented()
            }
        }
    }
}