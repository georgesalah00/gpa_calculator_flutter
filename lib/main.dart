import 'package:flutter/material.dart';
import 'core/routes/app_router.dart';
import 'gpa_calculator_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GpaCalculatorApp(appRouter: AppRouter()));
}
// TODO: حل مشكلة عدم ظهور الكلام في 
//
//! RELEASE MODE
