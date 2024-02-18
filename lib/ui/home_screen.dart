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
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          icon: Icon(Icons.check_circle_outline,
              size: 18.0, color: Theme.of(context).colorScheme.inverseSurface),
          label: Text("Finish",
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Theme.of(context).colorScheme.inverseSurface,
                  fontWeight: FontWeight.w500))),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(Icons.info_outline,
                      size: 18.0,
                      color: Theme.of(context).colorScheme.inverseSurface),
                  spacerRow8px,
                  Text("Please enter a phone number",
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
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
