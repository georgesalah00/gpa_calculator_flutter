import '../../core/helpers/enums.dart';
import 'package:uuid/uuid.dart';

class Course {
   final String name;
   final int credits;
   final GPAGrade grade;
   late final String id;

  Course({required this.name, required this.credits, required this.grade}){
    id = const Uuid().v4();
  }


  double get courseGPA =>  grade.gpa * credits;
}