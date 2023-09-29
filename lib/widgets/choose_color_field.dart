import 'package:flutter/material.dart';

import '../Utils/dimensions.dart';
import '../Utils/main_colors.dart';

class ChooseColorField extends StatelessWidget {
  const ChooseColorField({Key? key, required this.nameOfTextField})
      : super(key: key);

  final String nameOfTextField;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 8),
          height: Dimensions.height * 0.09,
          width: Dimensions.width * 0.2,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.withOpacity(0.7),
            ),
            borderRadius: BorderRadius.circular(
              Dimensions.height * 0.01,
            ),
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 15,
            ),
            color: Colors.red,
          ),
        ),
        Positioned(
          top: 0,
          left: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: Dimensions.width * 0.05,
            color: MainColors.lightBrown,
            child: Text(
              nameOfTextField,
              style: TextStyle(
                color: Colors.white,
                fontSize: Dimensions.width * 0.035,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
