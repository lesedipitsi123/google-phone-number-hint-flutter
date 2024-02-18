package com.bt.studios.apps.google_phone_number_hint_flutter.google_phone_number_hint_flutter

import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterFragmentActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        handlePhoneHintMethodChannel(flutterEngine)
    }

    private fun handlePhoneHintMethodChannel(flutterEngine: FlutterEngine) {
        val handler = PhoneHintMethodChannelHandler(this)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, phoneHintChannel)
            .setMethodCallHandler(handler)
    }

    companion object {
        private const val phoneHintChannel =
            "com.bt.studios.apps.google_phone_number_hint_flutter.google_phone_number_hint_flutter/phone_hint"
    }
}


