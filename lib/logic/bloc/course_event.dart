part of 'course_bloc.dart';

@immutable
sealed class CourseEvent {}

class AddCourse extends CourseEvent  {
    final String name;
    final int credits;
    final GPAGrade grade;

  AddCourse({required this.name, required this.credits, required this.grade});
    
}

class ClaculateGPA extends CourseEvent {
  final int prevCredits;
  final double prevGPA;

  ClaculateGPA({required this.prevCredits, required this.prevGPA});
  
}

class DeleteCourse extends CourseEvent{
  final String id;

  DeleteCourse({required this.id});
  
}


class ResetCalculation extends CourseEvent {}