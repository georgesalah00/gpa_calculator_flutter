import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'routes.dart';
import '../../data/repository/gpa_repository.dart';
import '../../logic/bloc/course_bloc.dart';
import '../../presentation/screens/calculating_screen.dart';
import '../../presentation/screens/results_screen.dart';
import '../../presentation/screens/welcome_screen.dart';

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
      case Routes.resultScreen:
        return MaterialPageRoute(builder: (_) {
          final arguments = settings.arguments as List<double>;
          return BlocProvider.value(
            value: cBloc,
            child: ResultsScreen(
              gpa: arguments[0],
              semisterGPA: arguments[1],
            ),
          );
        });
      default:
        return null;
    }
  }
}
