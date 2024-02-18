package com.bt.studios.apps.google_phone_number_hint_flutter.google_phone_number_hint_flutter

import androidx.activity.ComponentActivity
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        handlePhoneHintMethodChannel(flutterEngine)
    }

    private fun handlePhoneHintMethodChannel(flutterEngine: FlutterEngine) {
        val handler = PhoneHintMethodChannelHandler(this.activity as ComponentActivity)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, phoneHintChannel)
            .setMethodCallHandler(handler)
    }

    companion object {
        private const val phoneHintChannel =
            "com.bt.studios.apps.google_phone_number_hint_flutter.google_phone_number_hint_flutter/phone_hint"
    }
}


