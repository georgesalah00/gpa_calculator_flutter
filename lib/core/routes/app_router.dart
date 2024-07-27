import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator_flutter/core/routes/routes.dart';
import 'package:gpa_calculator_flutter/data/repository/gpa_repository.dart';
import 'package:gpa_calculator_flutter/logic/bloc/course_bloc.dart';
import 'package:gpa_calculator_flutter/presentation/screens/calculating_screen.dart';
import 'package:gpa_calculator_flutter/presentation/screens/welcome_screen.dart';

class AppRouter {
  final GpaRepository gR = GpaRepository();

  Route? onGenerateRoute(RouteSettings settings) {
    final CourseBloc cBloc = CourseBloc(gR);

    switch (settings.name) {
      case Routes.welcomeScreen:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case Routes.calculatingScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: cBloc,
                  child: const CalculatingScreen(),
                ));
      default:
        return null;
    }
  }
}
