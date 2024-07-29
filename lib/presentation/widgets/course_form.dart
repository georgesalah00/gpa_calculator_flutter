import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/helpers/enums.dart';
import '../../core/helpers/screen_spacing.dart';
import '../../core/theme/decorations.dart';
import '../../core/theme/styles.dart';
import '../../core/widgets/app_text_form_field.dart';
import '../../logic/bloc/course_bloc.dart';

class CourseForm extends StatefulWidget {
  const CourseForm({super.key});

  @override
  State<CourseForm> createState() => _CourseFormState();
}

class _CourseFormState extends State<CourseForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _creditsController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  GPAGrade? _selectedGrade;

  @override
  void dispose() {
    _nameController.dispose();
    _creditsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                flex: 4,
                child: AppTextFormField(
                  controller: _nameController,
                  label: 'Course name',
                  validate: (name) {
                    if (name == null || name.isEmpty) {
                      return 'Please enter the course name or its id';
                    }
                    return null;
                  },
                ),
              ),
              ScreenSpacing.horizontalSpacing(10),
              Expanded(
                flex: 2,
                child: AppTextFormField(
                  controller: _creditsController,
                  label: 'Credits',
                  validate: _validateCreditsFormField,
                ),
              ),
              ScreenSpacing.horizontalSpacing(10),
              _buildDropdownForm()
            ],
          ),
          ScreenSpacing.verticalSpacing(10),
          SizedBox(
            width: 250.w,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  String name = _nameController.text;

                  int credits = int.parse(_creditsController.text);
                  _nameController.clear();
                  _creditsController.clear();

                  context.read<CourseBloc>().add(AddCourse(
                      name: name, credits: credits, grade: _selectedGrade!));
                }
              },
              style: Decorations.orangeButtonStyle(),
              child: SizedBox(
                child: Text(
                  'Add Course',
                  style: Styles.font16WhiteBold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Expanded _buildDropdownForm() {
    return Expanded(
      flex: 2,
      child: DropdownButtonFormField(
        value: _selectedGrade,
        decoration: InputDecoration(
          labelText: 'Grade',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
        ),
        items: const [
          DropdownMenuItem(
            value: GPAGrade.APlus,
            child: Text('A+'),
          ),
          DropdownMenuItem(
            value: GPAGrade.A,
            child: Text('A'),
          ),
          DropdownMenuItem(
            value: GPAGrade.AMinus,
            child: Text('A-'),
          ),
          DropdownMenuItem(
            value: GPAGrade.BPlus,
            child: Text('B+'),
          ),
          DropdownMenuItem(
            value: GPAGrade.B,
            child: Text('B'),
          ),
          DropdownMenuItem(
            value: GPAGrade.BMinus,
            child: Text('B-'),
          ),
          DropdownMenuItem(
            value: GPAGrade.CPlus,
            child: Text('C+'),
          ),
          DropdownMenuItem(
            value: GPAGrade.C,
            child: Text('C'),
          ),
          DropdownMenuItem(
            value: GPAGrade.CMinus,
            child: Text('C-'),
          ),
          DropdownMenuItem(
            value: GPAGrade.DPlus,
            child: Text('D+'),
          ),
          DropdownMenuItem(
            value: GPAGrade.D,
            child: Text('D'),
          ),
          DropdownMenuItem(
            value: GPAGrade.F,
            child: Text('F'),
          ),
        ],
        onChanged: (GPAGrade? grade) {
          _selectedGrade = grade!;
        },
        validator: (grade) {
          if (grade == null || _selectedGrade == null) {
            return 'please enter your grade';
          }
          return null;
        },
      ),
    );
  }

  String? _validateCreditsFormField(credits) {
    if (credits == null || credits.isEmpty) {
      return 'Please enter the number of credits. if you haven\'t just type 0';
    } else if (credits.contains('.')) {
      return 'You can\'t type your credits as a decimal number . please type your credits right ';
    }

    return null;
  }
}
