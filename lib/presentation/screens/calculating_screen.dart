import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator_flutter/core/helpers/screen_spacing.dart';
import 'package:gpa_calculator_flutter/core/theme/decorations.dart';
import 'package:gpa_calculator_flutter/core/theme/styles.dart';
import 'package:gpa_calculator_flutter/logic/bloc/course_bloc.dart';
import 'package:gpa_calculator_flutter/presentation/widgets/course_form.dart';
import 'package:gpa_calculator_flutter/presentation/widgets/course_tile.dart';

class CalculatingScreen extends StatelessWidget {
  const CalculatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red.shade800,
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
                      style: Styles.font16WhiteBold,
                    ),
                  ),
                  ScreenSpacing.verticalSpacing(30),
                  Expanded(
                    child: Decorations.dialogDecoration(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 40.h, left: 20.w, right: 20.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CourseForm(),
                              ScreenSpacing.verticalSpacing(20),
                              if (state.courses != null)
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: state.courses!.length,
                                    itemBuilder: (context, index) => CourseTile(
                                      course: state.courses![index],
                                    ),
                                  ),
                                ),
                              ScreenSpacing.verticalSpacing(10),
                              Container(
                                width: 250.w,
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                child: ElevatedButton(
                                  onPressed: state.courses != null ? () {} : (){
                                    // TODO: continue from here
                                    // context.read<CourseBloc>().add(ClaculateGPA());
                                  },
                                  style: Decorations.orangeButtonStyle(),
                                  child: Text(
                                    'Calculate GPA',
                                    style: Styles.font16WhiteBold,
                                  ),
                                ),
                              )
                            ],
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
