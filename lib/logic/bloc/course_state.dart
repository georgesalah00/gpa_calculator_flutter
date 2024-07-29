part of 'course_bloc.dart';

@immutable
sealed class CourseState {
  final List<Course>? courses;

  const CourseState({this.courses});
}

final class CourseInitial extends CourseState {}

final class AddedCourse extends CourseState {
  const AddedCourse({required super.courses});
}

final class DeletedCourse extends CourseState {
  const DeletedCourse({required super.courses});
}

final class GPACalculated extends CourseState {
  final double gpa;
  final double semisterGpa;
  const GPACalculated({required this.semisterGpa, required this.gpa, required super.courses});
}
