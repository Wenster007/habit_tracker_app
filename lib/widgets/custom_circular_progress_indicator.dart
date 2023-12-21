import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator(
      {Key? key, required this.progress, required this.color})
      : super(key: key);

  final double progress; //should be between 0 & 1;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 10.0,
      lineWidth: 3.3,
      percent: progress,
      progressColor: color,
    );
  }
}
