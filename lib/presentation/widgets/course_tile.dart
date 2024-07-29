import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/helpers/extensions.dart';
import '../../core/theme/decorations.dart';
import '../../core/theme/styles.dart';
import '../../data/models/course.dart';
import '../../logic/bloc/course_bloc.dart';

class CourseTile extends StatelessWidget {
  final Course course;
  const CourseTile({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          titleTextStyle: Styles.font20Black,
          leading: Container(
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
            ),
          ),
          subtitleTextStyle: Styles.font12grey,
          title: Text(course.name),
          subtitle: Text('Number of Credits: ${course.credits}'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Delete Course'),
                      content:
                          const Text('Are you sure you want to delete this course?'),
                      actions: [
                        TextButton(
                          style: Decorations.dialogButtonStyle(),
                          onPressed: () {
                            context
                                .read<CourseBloc>()
                                .add(DeleteCourse(id: course.id));
                            Navigator.of(context).pop();
                          },
                          child: const Text('Yes'),
                        ),
                        TextButton(
                          style: Decorations.dialogButtonStyle(),
                          onPressed: () {
                            context.pop(context);
                          },
                          child: const Text('No'),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.delete),
                style: IconButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red.shade500),
              )
            ],
          ),
        ),
        Divider(
          thickness: 1.h,
          endIndent: 60.w,
          indent: 60.w,
          color: Colors.orange.shade400,
        ),
      ],
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
