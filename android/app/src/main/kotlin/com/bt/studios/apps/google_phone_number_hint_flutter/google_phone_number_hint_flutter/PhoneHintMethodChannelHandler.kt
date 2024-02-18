package com.bt.studios.apps.google_phone_number_hint_flutter.google_phone_number_hint_flutter

import android.app.Activity
import android.app.PendingIntent
import android.util.Log
import androidx.activity.ComponentActivity
import androidx.activity.result.IntentSenderRequest
import androidx.activity.result.contract.ActivityResultContracts
import com.google.android.gms.auth.api.identity.GetPhoneNumberHintIntentRequest
import com.google.android.gms.auth.api.identity.Identity
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class PhoneHintMethodChannelHandler(private val activity: ComponentActivity) :
    MethodChannel.MethodCallHandler {
    private lateinit var phoneNumber: String
    private val request: GetPhoneNumberHintIntentRequest =
        GetPhoneNumberHintIntentRequest.builder().build()
    private val phoneNumberHintIntentResultLauncher = activity.registerForActivityResult(
        ActivityResultContracts.StartIntentSenderForResult()
    ) { result ->
        try {
            phoneNumber = Identity.getSignInClient(activity).getPhoneNumberFromIntent(result.data)
        } catch (e: Exception) {
            Log.e(TAG, "Phone Number Hint failed")
        }
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "getPhoneNumberHint" -> {
                requestPhoneHint()

                result.success(phoneNumber)
            }

            else -> {
                result.notImplemented()
            }
        }
    }

    private fun requestPhoneHint() {
        Identity.getSignInClient(activity)
            .getPhoneNumberHintIntent(request)
            .addOnSuccessListener { result: PendingIntent ->
                try {
                    phoneNumberHintIntentResultLauncher.launch(
                        IntentSenderRequest.Builder(result).build()
                    )
                } catch (e: Exception) {
                    Log.e(TAG, "Launching the PendingIntent failed")
                }
            }
            .addOnFailureListener {
                Log.e(TAG, "Phone Number Hint failed")
            }
    }


    companion object {
        private const val TAG = "PhoneHintMethodChannel"
    }
}
