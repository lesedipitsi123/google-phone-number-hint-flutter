import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_phone_number_hint_flutter/bloc/phone_hint_cubit.dart';
import 'package:google_phone_number_hint_flutter/common/dimens.dart';
import 'package:google_phone_number_hint_flutter/ui/widgets/google_phone_hint_button.dart';
import 'package:google_phone_number_hint_flutter/ui/widgets/phone_number_field.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

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
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            spacerColumn48px,
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
            BlocBuilder<PhoneHintCubit, String>(
              builder: (context, state) {
                textInputController.text = state;

                return PhoneNumberField(
                  controller: textInputController,
                );
              },
            ),
            spacerColumn16px,
            GooglePhoneHintButton(
                onPress: () =>
                    context.read<PhoneHintCubit>().getGooglePhoneNumber())
          ],
        ),
      ),
    );
  }
}
