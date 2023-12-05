import 'package:flutter/material.dart';
import 'package:habit_tracker/widgets/color_dialogue_box.dart';

import '../Utils/dimensions.dart';
import '../Utils/main_colors.dart';

class ChooseColorField extends StatefulWidget {
  const ChooseColorField({Key? key, required this.nameOfTextField, required this.onChangeColor})
      : super(key: key);

  final void Function(Color) onChangeColor;
  final String nameOfTextField;

  @override
  State<ChooseColorField> createState() => _ChooseColorFieldState();
}

class _ChooseColorFieldState extends State<ChooseColorField> {

  Color currentSelectedColor = Colors.red;


  void onColorChange(Color newSelectedColor) {
    setState(() {
      currentSelectedColor = newSelectedColor; //used for handling the color of container on screen
    });
    widget.onChangeColor(newSelectedColor); //used for sending back the color selected for saving purpose
  }

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
          child: GestureDetector(
            onTap: () {
              showGeneralDialog(
                  context: context,
                  barrierDismissible: true,
                  barrierLabel: MaterialLocalizations.of(context)
                      .modalBarrierDismissLabel,
                  barrierColor: Colors.black.withOpacity(0.5),
                  transitionDuration: const Duration(milliseconds: 0),
                  pageBuilder: (BuildContext context, Animation animation,
                      Animation secondaryAnimation) {
                    return ColorDialogueBox(onColorChange: onColorChange,);
                  });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 15,
              ),
              color: currentSelectedColor,
            ),
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
