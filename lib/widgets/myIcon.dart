import 'package:flutter/material.dart';
import 'package:habit_tracker/Utils/dimensions.dart';

class MyIcon extends StatelessWidget {
  const MyIcon({Key? key, required this.iconData, required this.onPressed})
      : super(key: key);

  final IconData iconData;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Icon(
          iconData,
          color: Colors.white,
          size: Dimensions.height * 0.036,
      ),
    );
  }
}
