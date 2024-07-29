import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ResultGauge extends StatelessWidget {
  final String title;
  final double gpa;
  const ResultGauge({
    super.key,
    required this.gpa,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      title: GaugeTitle(text: title),
      enableLoadingAnimation: true,
      animationDuration: 2000,
      axes: [
        RadialAxis(
          minimum: 0,
          maximum: 4,
          ranges: [
            GaugeRange(
              startValue: 0,
              endValue: 1,
              color: Colors.red,
            ),
            GaugeRange(startValue: 1, endValue: 2, color: Colors.orange),
            GaugeRange(startValue: 2, endValue: 3, color: Colors.yellow),
            GaugeRange(
              startValue: 3,
              endValue: 4,
              color: Colors.green,
            ),
          ],
          pointers: [
            NeedlePointer(
              value: gpa,
            )
          ],
          annotations: [
            GaugeAnnotation(
              widget: Text(
                gpa.toString(),
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              angle: 90,
              positionFactor: 0.5,
            )
          ],
        ),
      ],
    );
  }
}
