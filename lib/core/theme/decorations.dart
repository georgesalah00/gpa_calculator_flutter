import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Decorations {
  static Container bodyContentDecoration(Widget child) => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.red.shade800,
              Colors.red.shade500,
              Colors.orange.shade900
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: child,
      );
  static ButtonStyle orangeButtonStyle() => ElevatedButton.styleFrom(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        backgroundColor: Colors.orangeAccent.shade700,
        elevation: 5,
        padding: EdgeInsets.symmetric(vertical: 10.h),
      );

  static Widget dialogDecoration(
          {required Widget child, double? height, required double radius}) =>
      Container(
          height: height != null ? height.h : 0.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radius.r),
              topRight: Radius.circular(radius.r),
            ),
          ),
          child: child);
}
