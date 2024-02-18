
import 'package:flutter/material.dart';
import 'package:google_phone_number_hint_flutter/common/routes.dart';
import 'package:google_phone_number_hint_flutter/common/theme.dart';

class GooglePhoneNumberHintApp extends StatelessWidget {
  const GooglePhoneNumberHintApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      routerConfig: Routes.routes,
    );
  }
}

void main() async {
  runApp(const GooglePhoneNumberHintApp());
}