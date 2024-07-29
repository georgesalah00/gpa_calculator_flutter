import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/helpers/screen_spacing.dart';
import 'result_gauge.dart';

class GaugesCard extends StatelessWidget {
  final double gpa;
  final double semisterGpa;
  const GaugesCard({super.key, required this.gpa, required this.semisterGpa});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: SizedBox(
        height: 400.h,
        child: Column(
          children: [
            Expanded(
              child: ResultGauge(
                gpa: gpa,
                title: 'Total GPA',
              ),
            ),
            ScreenSpacing.horizontalSpacing(10),
            Expanded(
              child: ResultGauge(
                gpa: semisterGpa,
                title: 'Semister GPA',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
