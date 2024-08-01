import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator_flutter/core/helpers/extensions.dart';
import 'package:gpa_calculator_flutter/core/helpers/scale_size.dart';
import 'package:gpa_calculator_flutter/core/theme/colors.dart';
import '../../core/helpers/screen_spacing.dart';
import '../../core/theme/decorations.dart';
import '../../core/theme/styles.dart';
import '../../logic/bloc/course_bloc.dart';
import '../widgets/calculation_form.dart';

class CalculatingScreen extends StatelessWidget {
  const CalculatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: context.themeMode(context) == Brightness.dark
            ? DarkThemeColors.appBarColor
            : LightThemeColors.appBarColor,
        child: SafeArea(
          child: BlocBuilder<CourseBloc, CourseState>(
            builder: (context, state) {
              return Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                    child: Text(
                      'Please complete this form to calculate your GPA',
                      style: Styles.font16Bold,
                      textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
                    ),
                  ),
                  ScreenSpacing.verticalSpacing(30),
                  Expanded(
                    child: Decorations.dialogDecoration(context,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 40.h, left: 20.w, right: 20.w),
                          child: CalculationForm(
                            courses: state.courses,
                          ),
                        ),
                        radius: 70),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
