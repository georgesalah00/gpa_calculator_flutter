import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator_flutter/core/theme/styles.dart';
import 'package:gpa_calculator_flutter/data/models/course.dart';

class CourseTile extends StatelessWidget {
  final Course course;
  const CourseTile({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      titleTextStyle: Styles.font20Black,
      leading: const Icon(
        Icons.book,
        color: Colors.amberAccent,
      ),
      subtitleTextStyle: Styles.font12grey,
      title: Text(course.name),
      subtitle: Text('Number of Credits: ${course.credits}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              alignment: Alignment.center,
              width: 30.w,
              height: 30.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: _getColorByName(course.grade.name),
              ),
              child: Text(
                course.grade.name,
                style: Styles.font16WhiteBold,
              )),
        ],
      ),
    );
  }

  Color _getColorByName(String name) {
    if (name.contains('A')) {
      return Colors.green;
    } else if (name.contains('B')) {
      return Colors.yellow;
    } else if (name.contains('C')) {
      return Colors.orange;
    } else if (name.contains('D')) {
      return Colors.orange.shade800;
    } else {
      return Colors.red;
    }
  }
}
