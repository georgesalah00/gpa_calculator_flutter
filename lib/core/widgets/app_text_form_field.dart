import 'package:flutter/material.dart';
import 'package:gpa_calculator_flutter/core/helpers/extensions.dart';
import 'package:gpa_calculator_flutter/core/theme/colors.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? hintText;
  final String? Function(String?) validate;
  const AppTextFormField(
      {super.key,
      required this.controller,
      required this.label,
      this.hintText,
      required this.validate});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: context.themeMode(context) == Brightness.dark
                    ? DarkThemeColors.borderColor
                    : LightThemeColors.borderColor)),
        labelText: label,
        hintText: hintText,
        floatingLabelStyle: TextStyle(
            color: context.themeMode(context) == Brightness.dark
                ? DarkThemeColors.textColor
                : LightThemeColors.textColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      keyboardType: label == 'Course name'
          ? TextInputType.name
          : const TextInputType.numberWithOptions(decimal: true),
      validator: validate,
    );
  }
}
