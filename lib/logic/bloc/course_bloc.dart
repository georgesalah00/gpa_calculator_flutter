

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../core/helpers/enums.dart';
import '../../data/models/course.dart';
import '../../data/repository/gpa_repository.dart';
import 'package:meta/meta.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final GpaRepository gR;
  CourseBloc(this.gR) : super(CourseInitial()) {
    on<AddCourse>(_handleAddCourse);
    on<ClaculateGPA>(_handleCalculateGPA);
    on<DeleteCourse>(_handleDeleteCourse);
    on<ResetCalculation>(_handlerResetCalculation);
  }

  void _handleAddCourse(AddCourse event, Emitter<CourseState> emit) {
    final course =
        Course(name: event.name, credits: event.credits, grade: event.grade);
    if (gR.courses.length <= 8) {
      gR.addCourse(course);
      emit(AddedCourse(courses: gR.courses));
    }
  }

  void _handleCalculateGPA(ClaculateGPA event, Emitter<CourseState> emit) {
    gR.prevCredits = event.prevCredits;
    gR.prevGPA = event.prevGPA;
    final gpa = gR.totalGPA;
    final semisterGpa = gR.semisterGPA;
    // print(gpa);
    emit(
        GPACalculated(gpa: gpa, semisterGpa: semisterGpa, courses: gR.courses));
  }

  void _handleDeleteCourse(DeleteCourse event, Emitter<CourseState> emit) {
    gR.deleteCourseById(event.id);
    emit(DeletedCourse(courses: gR.courses));
  }

  void _handlerResetCalculation(ResetCalculation event, Emitter<CourseState> emit) {
    gR.resetCalculation();
    emit(CourseInitial());
  }
}
