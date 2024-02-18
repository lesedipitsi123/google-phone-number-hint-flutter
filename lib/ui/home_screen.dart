import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_phone_number_hint_flutter/bloc/phone_hint_cubit.dart';
import 'package:google_phone_number_hint_flutter/ui/home_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PhoneHintCubit(),
      child: HomeView(),
    );
  }
}
