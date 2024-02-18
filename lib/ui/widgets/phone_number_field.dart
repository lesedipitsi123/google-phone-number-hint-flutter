import 'package:flutter/material.dart';

class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField({super.key, required this.controller});

  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.phone,
      cursorColor: Theme.of(context).colorScheme.inverseSurface,
      maxLength: 20,
      decoration: InputDecoration(
        icon: const Icon(Icons.phone),
        labelText: "Phone number",
        labelStyle:
            TextStyle(color: Theme.of(context).colorScheme.inverseSurface),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
