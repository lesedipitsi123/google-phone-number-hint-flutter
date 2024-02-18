import 'package:go_router/go_router.dart';
import 'package:google_phone_number_hint_flutter/ui/home_screen.dart';

class Routes {
  static String home = "/home";

  static final routes = GoRouter(
    initialLocation: home,
    routes: [
      GoRoute(
        path: home,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
