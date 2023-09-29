import 'package:flutter/material.dart';
import 'package:habit_tracker/Utils/dimensions.dart';
import 'package:habit_tracker/Utils/main_colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {Key? key,
      required this.textEditingController,
      required this.nameOfTextField, required this.hintText})
      : super(key: key);

  final TextEditingController textEditingController;
  final String nameOfTextField;
  final String hintText;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 8),
          height: Dimensions.height * 0.09,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.withOpacity(0.7),
            ),
            borderRadius: BorderRadius.circular(
              Dimensions.height * 0.01,
            ),
          ),
          alignment: Alignment.center,
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Dimensions.height * 0.025),
            child: TextField(
              controller: widget.textEditingController,
              style: TextStyle(
                color: Colors.white,
                fontSize: Dimensions.width * 0.05,
              ),
              decoration: InputDecoration(
                hintText: widget.hintText,
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: Dimensions.height * 0.024,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 15,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: Dimensions.width * 0.05,
            color: MainColors.lightBrown,
            child: Text(
              widget.nameOfTextField,
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
