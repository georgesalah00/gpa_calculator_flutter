// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator_flutter/core/helpers/extensions.dart';
import 'package:gpa_calculator_flutter/core/helpers/scale_size.dart';

import 'package:gpa_calculator_flutter/core/helpers/screen_spacing.dart';
import 'package:gpa_calculator_flutter/core/routes/routes.dart';
import 'package:gpa_calculator_flutter/core/theme/decorations.dart';
import 'package:gpa_calculator_flutter/core/theme/styles.dart';
import 'package:gpa_calculator_flutter/data/models/course.dart';
import 'package:gpa_calculator_flutter/logic/bloc/course_bloc.dart';
import 'package:gpa_calculator_flutter/presentation/widgets/course_form.dart';
import 'package:gpa_calculator_flutter/presentation/widgets/course_tile.dart';
import 'package:numberpicker/numberpicker.dart';

// ignore: must_be_immutable
class CalculationForm extends StatefulWidget {
  List<Course>? courses;
  CalculationForm({
    super.key,
    this.courses,
  });

  @override
  State<CalculationForm> createState() => _CalculationFormState();
}

class _CalculationFormState extends State<CalculationForm> {
  int _prevCredits = 0;
  double _prevGpa = 0.00;
  @override
  Widget build(BuildContext context) {
    return BlocListener<CourseBloc, CourseState>(
        listener: (context, state) {
          if (state is GPACalculated) {
            final gpa = state.gpa;
            final semisterGpa = state.semisterGpa;
            Navigator.of(context).pushReplacementNamed(Routes.resultScreen,
                arguments: [gpa, semisterGpa]);
          }
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 250.w,
                // padding: EdgeInsets.symmetric(vertical: 10.h),
                child: ElevatedButton(
                  onPressed: (widget.courses == null || widget.courses!.isEmpty)
                      ? () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: const Text('Error'),
                              content: const Text(
                                  'You can\'t claculate gpa without courses :)'),
                              actions: [
                                TextButton(
                                  style: Decorations.buttonStyle(context),
                                  onPressed: () {
                                    context.pop(context);
                                  },
                                  child: const Text('Ok'),
                                ),
                              ],
                            ),
                          );
                        }
                      : () {
                          context.read<CourseBloc>().add(ClaculateGPA(
                              prevCredits: _prevCredits, prevGPA: _prevGpa));
                        },
                  style: Decorations.buttonStyle(context),
                  child: Text(
                    'Calculate GPA',
                    style: Styles.font16Bold,
                    textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
                  ),
                ),
              ),
              ScreenSpacing.verticalSpacing(20),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Previous GPA',
                              textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
                              style: Styles.font15,
                            ),
                            ScreenSpacing.verticalSpacing(5),
                            Container(
                              decoration:
                                  Decorations.pickerDecorations(context),
                              child: DecimalNumberPicker(
                                itemHeight: 30,
                                itemWidth: 50,
                                minValue: 0,
                                maxValue: 4,
                                decimalPlaces: 2,
                                value: _prevGpa,
                                onChanged: (value) => setState(() {
                                  _prevGpa = value;
                                }),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Previous Credits',
                              style: Styles.font15,
                              textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),

                            ),
                            ScreenSpacing.verticalSpacing(5),
                            Container(
                              decoration:
                                  Decorations.pickerDecorations(context),
                              child: NumberPicker(
                                itemHeight: 30,
                                minValue: 0,
                                maxValue: 150,
                                value: _prevCredits,
                                onChanged: (value) => setState(() {
                                  _prevCredits = value;
                                }),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  ScreenSpacing.verticalSpacing(20),
                  const CourseForm(),
                ],
              ),
              SizedBox(
                  height: 270.h,
                  child: widget.courses != null
                      ? ListView.builder(
                          itemCount: widget.courses!.length,
                          itemBuilder: (context, index) => CourseTile(
                            course: widget.courses![index],
                          ),
                        )
                      : Container()),
            ],
          ),
        ));
  }
}
