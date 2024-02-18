import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_phone_number_hint_flutter/gen/assets.gen.dart';

class GooglePhoneHintButton extends StatelessWidget {
  const GooglePhoneHintButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: null,
      style: ButtonStyle(
          side: MaterialStateProperty.all(
              BorderSide(color: Theme.of(context).colorScheme.outline)),
          padding: MaterialStateProperty.all(const EdgeInsets.all(16.0)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)))),
      label: Text("Choose a phone number",
          style: TextStyle(color: Theme.of(context).colorScheme.onBackground)),
      icon: SvgPicture.asset(
        Assets.icons.googleLogo,
        height: 20.0,
        width: 20.0,
      ),
    );
  }
}