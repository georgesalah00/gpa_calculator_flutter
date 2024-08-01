import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/routes/app_router.dart';
import 'gpa_calculator_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(GpaCalculatorApp(
    appRouter: AppRouter(prefs: prefs),
    prefs: prefs,
  ));
}
