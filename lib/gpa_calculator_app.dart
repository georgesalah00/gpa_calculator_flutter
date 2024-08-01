import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator_flutter/core/helpers/extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/routes/app_router.dart';
import 'core/routes/routes.dart';

class GpaCalculatorApp extends StatelessWidget {
  final SharedPreferences prefs;
  final AppRouter appRouter;
  const GpaCalculatorApp(
      {super.key, required this.appRouter, required this.prefs});

  @override
  Widget build(BuildContext context) {
    final openedBefore = prefs.getBool('openedBefore') ?? false;
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        title: 'GPA Calculator',
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        themeMode: context.themeMode(context) == Brightness.dark
            ? ThemeMode.dark
            : ThemeMode.light,
        initialRoute:
            !openedBefore ? Routes.welcomeScreen : Routes.calculatingScreen,
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
