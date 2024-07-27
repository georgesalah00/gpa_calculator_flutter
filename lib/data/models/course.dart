import 'package:gpa_calculator_flutter/core/helpers/enums.dart';

class Course {
   final String name;
   final int credits;
   final GPAGrade grade;

  Course({required this.name, required this.credits, required this.grade});


  double get courseGPA =>  grade.gpa * credits;
}