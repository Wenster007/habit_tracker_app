import 'package:flutter/material.dart';
import 'package:habit_tracker/Utils/dimensions.dart';

class HeadingText extends StatelessWidget {
  const HeadingText({Key? key, required this.text, this.color})
      : super(key: key);

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? Colors.white,
        fontSize: Dimensions.width * 0.06,
        fontWeight: FontWeight.w500
      ),
    );
  }
}
