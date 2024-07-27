import 'package:gpa_calculator_flutter/data/models/course.dart';

class GpaRepository {
  
  // ignore: prefer_final_fields
  List<Course> _courses = [];

  List<Course> get courses => _courses;

  void addCourse(Course course){
    _courses.add(course);
  }

  
}