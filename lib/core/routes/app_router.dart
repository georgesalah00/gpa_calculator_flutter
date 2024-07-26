import 'package:flutter/material.dart';
import 'package:gpa_calculator_flutter/core/routes/routes.dart';
import 'package:gpa_calculator_flutter/presentation/screens/calculating_screen.dart';
import 'package:gpa_calculator_flutter/presentation/screens/welcome_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.welcomeScreen:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case Routes.calculatingScreen:
      return MaterialPageRoute(builder: (_) => const CalculatingScreen());
      default:
        return null;
    }
  }
}
