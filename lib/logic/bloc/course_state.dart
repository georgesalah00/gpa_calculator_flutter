part of 'course_bloc.dart';

@immutable
sealed class CourseState {}

final class CourseInitial extends CourseState {}

final class AddedCourse extends CourseState{
  final List<Course> courses;
  AddedCourse({required this.courses});
}
