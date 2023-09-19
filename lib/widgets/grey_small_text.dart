import 'package:flutter/material.dart';
import 'package:habit_tracker/Utils/dimensions.dart';

class GreySmallText extends StatelessWidget {
  const GreySmallText({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: Dimensions.width * 0.029,
        fontWeight: FontWeight.w500,
        color: Colors.grey
      ),
    );
  }
}
