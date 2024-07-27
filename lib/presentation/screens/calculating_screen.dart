import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator_flutter/core/helpers/screen_spacing.dart';
import 'package:gpa_calculator_flutter/core/theme/decorations.dart';
import 'package:gpa_calculator_flutter/core/theme/styles.dart';
import 'package:gpa_calculator_flutter/logic/bloc/course_bloc.dart';

class CalculatingScreen extends StatelessWidget {
  const CalculatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CourseBloc, CourseState>(
          builder: (context, state) {
            return Decorations.bodyContentDecoration(Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                  child: Text(
                    'Please complete this form to calculate your GPA',
                    style: Styles.font16WhiteBold,
                  ),
                ),
                ScreenSpacing.verticalSpacing(30),
                Decorations.dialogDecoration(
                    child: Container(), height: 550, radius: 70),
              ],
            ));
          },
        ),
      ),
    );
  }
}
