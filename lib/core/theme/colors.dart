import 'package:flutter/material.dart';

abstract class LightThemeColors {
  static Color appBarColor = Colors.red.shade800;
  static List<Color> linearGradientColors = [
    Colors.red.shade800,
    Colors.red.shade500,
    Colors.orange.shade900
  ];
  static Color dialogColor = Colors.white;
  static Color textColor = Colors.black;
  static Color subTextColor = Colors.grey.shade500;
  static Color buttonColor = Colors.orange.shade800;
  static Color borderColor = Colors.orange.shade600;
  static Color buttonTextColor = Colors.white;
  static Color dividerColor = Colors.orange.shade800;
}

abstract class DarkThemeColors {
  static Color appBarColor = Colors.purple.shade800;
  static List<Color> linearGradientColors = [
    Colors.purple.shade800,
    Colors.purple.shade400,
    Colors.pink
  ];
  static Color dialogColor = Colors.black;
  static Color textColor = Colors.white;
  static Color subTextColor = Colors.grey.shade400;
  static Color buttonColor = const Color.fromARGB(255, 73, 236, 81);
  static Color borderColor = Colors.pink.shade800;
  static Color buttonTextColor = Colors.black;
  static Color dividerColor = Colors.pink.shade800;
}
