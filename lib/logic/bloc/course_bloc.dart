import 'package:bloc/bloc.dart';
import 'package:gpa_calculator_flutter/core/helpers/enums.dart';
import 'package:gpa_calculator_flutter/data/models/course.dart';
import 'package:gpa_calculator_flutter/data/repository/gpa_repository.dart';
import 'package:meta/meta.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final GpaRepository gR;
  CourseBloc(this.gR) : super(CourseInitial()) {
    on<AddCourse>(_handleAddCourse);
  }

  void _handleAddCourse(AddCourse event, Emitter<CourseState> emit) {
    final course =
        Course(name: event.name, credits: event.credits, grade: event.grade);
    gR.addCourse(course);
    emit(AddedCourse(courses: gR.courses));
  }
}
