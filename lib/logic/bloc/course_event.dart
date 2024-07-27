part of 'course_bloc.dart';

@immutable
sealed class CourseEvent {}

class AddCourse extends CourseEvent  {
    final String name;
    final int credits;
    final GPAGrade grade;

  AddCourse({required this.name, required this.credits, required this.grade});
    
}
