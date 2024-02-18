import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_phone_number_hint_flutter/common/dimens.dart';
import 'package:google_phone_number_hint_flutter/ui/widgets/google_phone_hint_button.dart';
import 'package:google_phone_number_hint_flutter/ui/widgets/phone_number_field.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController textInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("Google Phone Hint",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontWeight: FontWeight.w500)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.info_outline,
                      size: 24,
                      color: Theme.of(context).colorScheme.inverseSurface),
                  spacerRow8px,
                  Text("Note: this works only on Android",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context).colorScheme.inverseSurface,
                          fontWeight: FontWeight.normal))
                ],
              ),
              spacerColumn16px,
              PhoneNumberField(
                controller: textInputController,
              ),
              spacerColumn16px,
              GooglePhoneHintButton(
                onPress: () async {
                  try {
                    String? phoneNumberHint = await const MethodChannel(
                            'com.bt.studios.apps.google_phone_number_hint_flutter.google_phone_number_hint_flutter/phone_hint')
                        .invokeMethod('getPhoneNumberHint');

                    textInputController.text = phoneNumberHint ?? "-----";
                  } on PlatformException catch (e) {
                    dev.log(e.message ?? "");
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
