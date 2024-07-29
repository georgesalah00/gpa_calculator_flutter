// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator_flutter/core/helpers/extensions.dart';

import 'package:gpa_calculator_flutter/core/helpers/screen_spacing.dart';
import 'package:gpa_calculator_flutter/core/routes/routes.dart';
import 'package:gpa_calculator_flutter/core/theme/decorations.dart';
import 'package:gpa_calculator_flutter/core/theme/styles.dart';
import 'package:gpa_calculator_flutter/core/widgets/app_text_form_field.dart';
import 'package:gpa_calculator_flutter/data/models/course.dart';
import 'package:gpa_calculator_flutter/logic/bloc/course_bloc.dart';
import 'package:gpa_calculator_flutter/presentation/widgets/course_form.dart';
import 'package:gpa_calculator_flutter/presentation/widgets/course_tile.dart';

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
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _previousCreditsController =
      TextEditingController();
  final TextEditingController _totalGpaController = TextEditingController();
  @override
  void dispose() {
    _previousCreditsController.dispose();
    _totalGpaController.dispose();
    super.dispose();
  }

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
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 250.w,
                  // padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: ElevatedButton(
                    onPressed:
                        (widget.courses == null || widget.courses!.isEmpty)
                            ? () {
                                showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                    title: const Text('Error'),
                                    content: const Text(
                                        'You can\'t claculate gpa without courses :)'),
                                    actions: [
                                      TextButton(
                                        style: Decorations.dialogButtonStyle(),
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
                                double previousTotalGpa =
                                    double.parse(_totalGpaController.text);
                                int previousCredits =
                                    int.parse(_previousCreditsController.text);
                                context.read<CourseBloc>().add(ClaculateGPA(
                                    prevCredits: previousCredits,
                                    prevGPA: previousTotalGpa));
                              },
                    style: Decorations.orangeButtonStyle(),
                    child: Text(
                      'Calculate GPA',
                      style: Styles.font16WhiteBold,
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
                        children: [
                          Expanded(
                            child: AppTextFormField(
                              controller: _totalGpaController,
                              label: 'Previous GPA',
                              hintText: 'Write the course name or its id',
                              validate: (name) {
                                if (name == null || name.isEmpty) {
                                  return 'please enter your previous total GPA, if you haven\'t just type 0';
                                }
                                return null;
                              },
                            ),
                          ),
                          ScreenSpacing.horizontalSpacing(10),
                          Expanded(
                            child: AppTextFormField(
                              controller: _previousCreditsController,
                              label: 'Previous Credits',
                              validate: (credit) {
                                if (credit == null || credit.isEmpty) {
                                  return 'please enter your previous total credits, if you haven\'t just type 0';
                                } else if (credit.contains('.')) {
                                  return 'please enter your previous total credits without decimal point';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    ScreenSpacing.verticalSpacing(10),
                    const CourseForm(),
                  ],
                ),
                Container(
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
          ),
        ));
  }
}
