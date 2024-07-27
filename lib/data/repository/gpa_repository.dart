// ignore_for_file: prefer_final_fields

import 'package:gpa_calculator_flutter/data/models/course.dart';

class GpaRepository {
  List<Course> _courses = [];
  List<double> _coursesGPA = [];
  int _prevCredits = 0;
  double _prevGPA = 0.0;

  List<Course> get courses => _courses;
  int get _semisterCredits {
    int sum = 0;
    for (var course in _courses) {
      sum += course.credits;
    }
    return sum;
  }

  double get _semisterTotalGPAPoints {
    double sum = 0;
    for (var i = 0; i < _courses.length; i++) {
      sum += _courses[i].grade.gpa;
    }
    return sum;
  }

  set prevCredits(int prevCredits) {
    _prevCredits = prevCredits;
  }

  set prevGPA(double gpa) {
    _prevGPA = gpa;
  }

  double get semisterGPA {
    return double.parse(
        (_semisterTotalGPAPoints / _semisterCredits).toStringAsFixed(2));
  }

  void addCourse(Course course) {
    if (_courses.length <= 7) {
      _courses.add(course);
    }
  }

  void calculateCoursesGPa() {
    for (var course in _courses) {
      final double courseGPA = course.courseGPA;
      _coursesGPA.add(courseGPA);
    }
  }

  String get totalGPA =>
      (((_prevGPA * _prevGPA) + (_semisterCredits + semisterGPA)) /
              (_prevCredits + _semisterTotalGPAPoints))
          .toStringAsFixed(2);
}
