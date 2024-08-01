import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator_flutter/core/helpers/scale_size.dart';
import 'package:gpa_calculator_flutter/core/theme/colors.dart';
import '../../core/helpers/extensions.dart';
import '../../core/helpers/screen_spacing.dart';
import '../../core/routes/routes.dart';
import '../../core/theme/decorations.dart';
import '../../core/theme/styles.dart';
import '../../logic/bloc/course_bloc.dart';
import '../widgets/gauges_card.dart';

class ResultsScreen extends StatelessWidget {
  final double gpa;
  final double semisterGPA;

  const ResultsScreen({
    super.key,
    required this.gpa,
    required this.semisterGPA,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: context.themeMode(context) == Brightness.dark
            ? DarkThemeColors.appBarColor
            : LightThemeColors.appBarColor,
        elevation: 0,
        title: Text(
          'Your GPA',
          style: Styles.font30WhiteBold,
          textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
        ),
      ),
      body: Column(
        children: [
          Decorations.bodyContentDecoration(
              context,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ScreenSpacing.verticalSpacing(10),
                    GaugesCard(
                      gpa: gpa,
                      semisterGpa: semisterGPA,
                    )
                  ],
                ),
              ),
              500,
              70),
          ScreenSpacing.verticalSpacing(10),
          SizedBox(
            width: 250.w,
            child: ElevatedButton(
              onPressed: () {
                context.read<CourseBloc>().add(ResetCalculation());
                context.pushReplacementNamed(context, Routes.calculatingScreen);
              },
              style: Decorations.buttonStyle(context),
              child: Text(
                'Re-Calculate',
                style: Styles.font20White,
                textScaler:
                    TextScaler.linear(ScaleSize.textScaleFactor(context)),
              ),
            ),
          ),
          ScreenSpacing.verticalSpacing(10),
          const Text(
            'Thank You for Using GPA Calculator',
          ),
          Text(
            'GPA Calculator \u00A9 George Salah rights',
            style: Styles.font12grey,
            textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
          )
        ],
      ),
    );
  }
}
