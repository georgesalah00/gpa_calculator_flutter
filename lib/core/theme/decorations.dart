import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator_flutter/core/helpers/extensions.dart';
import 'package:gpa_calculator_flutter/core/theme/colors.dart';

class Decorations {
  static Container bodyContentDecoration(
          BuildContext ctx, Widget child, double height,
          [double? radius]) =>
      Container(
        height: height.h,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: ctx.themeMode(ctx) == Brightness.light
                  ? LightThemeColors.linearGradientColors
                  : DarkThemeColors.linearGradientColors,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(radius ?? 0.0),
              bottomRight: Radius.circular(radius ?? 0.0),
            )),
        child: child,
      );

  static BoxDecoration pickerDecorations(BuildContext ctx) => BoxDecoration(
        border: Border.all(
            color: ctx.themeMode(ctx) == Brightness.dark
                ? DarkThemeColors.borderColor
                : LightThemeColors.borderColor),
        borderRadius: BorderRadius.circular(20),
      );
  static ButtonStyle buttonStyle(BuildContext ctx) => ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      backgroundColor: ctx.themeMode(ctx) == Brightness.dark
          ? DarkThemeColors.buttonColor
          : LightThemeColors.buttonColor,
      elevation: 5,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      foregroundColor: ctx.themeMode(ctx) == Brightness.dark
          ? DarkThemeColors.buttonTextColor
          : LightThemeColors.buttonTextColor);

  static Widget dialogDecoration(BuildContext ctx,
          {required Widget child, double? height, required double radius}) =>
      Container(
          height: height != null ? height.h : 0.0,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
                    width: 2,
                    color: ctx.themeMode(ctx) == Brightness.dark
                        ? DarkThemeColors.borderColor
                        : LightThemeColors.borderColor)),
            color: ctx.themeMode(ctx) == Brightness.dark
                ? DarkThemeColors.dialogColor
                : LightThemeColors.dialogColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radius.r),
              topRight: Radius.circular(radius.r),
            ),
          ),
          child: child);
}
