import 'dart:developer' as dev;

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneHintCubit extends Cubit<String>{

  PhoneHintCubit() : super("");

  static const _hintMethodChannelName = "com.bt.studios.apps.google_phone_number_hint_flutter.google_phone_number_hint_flutter/phone_hint";

  void getGooglePhoneNumber() async {
    try {
      var phoneNumberHint = await const MethodChannel(_hintMethodChannelName)
          .invokeMethod("getPhoneNumberHint");
      
      emit(phoneNumberHint);
      
    } on PlatformException catch (e) {
      dev.log("Exception: ${e.message}");
      emit("");
    }
  }
}