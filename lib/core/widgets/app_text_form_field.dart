import 'package:flutter/material.dart';

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
        labelText: label,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.8),
      ),
      keyboardType: label == 'Course name'
          ? TextInputType.name
          : const TextInputType.numberWithOptions(decimal: true),
      validator: validate,
    );
  }
}
