import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenSpacing {
  static SizedBox horizontalSpacing(double width) => SizedBox(
        width: width.w,
      );
  static SizedBox verticalSpacing(double height) => SizedBox(
        height: height.h,
      );
}
