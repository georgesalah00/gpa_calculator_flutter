import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/helpers/extensions.dart';
import '../../core/helpers/scale_size.dart';
import '../../core/theme/colors.dart';
import 'package:numberpicker/numberpicker.dart';
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

  int _credits = 1;
  final TextEditingController _nameController = TextEditingController();

  GPAGrade? _selectedGrade;

  @override
  void dispose() {
    _nameController.dispose();
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
              _buildDropdownForm(context),
              ScreenSpacing.horizontalSpacing(10),
              Container(
                decoration: Decorations.pickerDecorations(context),
                child: NumberPicker(
                  itemWidth: 50.w,
                  itemHeight: 25.h,
                  maxValue: 3,
                  minValue: 1,
                  value: _credits,
                  onChanged: (value) => setState(() {
                    _credits = value;
                  }),
                ),
              ),
            ],
          ),
          ScreenSpacing.verticalSpacing(10),
          SizedBox(
            width: 250.w,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  String name = _nameController.text;

                  _nameController.clear();

                  context.read<CourseBloc>().add(AddCourse(
                      name: name, credits: _credits, grade: _selectedGrade!));
                }
              },
              style: Decorations.buttonStyle(context),
              child: SizedBox(
                child: Text(
                  'Add Course',
                  style: Styles.font16Bold,
                  textScaler:
                      TextScaler.linear(ScaleSize.textScaleFactor(context)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Expanded _buildDropdownForm(BuildContext ctx) {
    return Expanded(
      flex: 2,
      child: DropdownButtonFormField(
        focusColor: ctx.themeMode(ctx) == Brightness.dark
            ? DarkThemeColors.borderColor
            : LightThemeColors.borderColor,
        menuMaxHeight: 100.h,
        elevation: 3,
        value: _selectedGrade,
        decoration: InputDecoration(
          floatingLabelStyle: TextStyle(
              color: ctx.themeMode(ctx) == Brightness.dark
                  ? DarkThemeColors.textColor
                  : LightThemeColors.textColor),
          labelText: 'Grade',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                color: ctx.themeMode(ctx) == Brightness.dark
                    ? DarkThemeColors.borderColor
                    : LightThemeColors.borderColor,
              )),
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
}
