import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator_flutter/core/routes/app_router.dart';
import 'package:gpa_calculator_flutter/core/routes/routes.dart';

class GpaCalculatorApp extends StatelessWidget {
  final AppRouter appRouter;
  const GpaCalculatorApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'GPA Calculator',
        // theme: ThemeData(),
        initialRoute: Routes.welcomeScreen,
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
