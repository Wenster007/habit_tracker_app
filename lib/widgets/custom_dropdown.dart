
import 'package:flutter/material.dart';
import 'package:habit_tracker/widgets/frequency_dialoogue_box.dart';

import '../Utils/dimensions.dart';
import '../Utils/main_colors.dart';

class CustomDropDown extends StatefulWidget
{
  const CustomDropDown({Key? key, required this.nameOfTextField})
      : super(key: key);

  final String nameOfTextField;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {

  String selectedFrequency = "everyday";
  String formatedSelectedFrequency = "Every Day";


  void updateSelectedFrequency(String newValue){
    setState(() {
      selectedFrequency = newValue;
      print(newValue);
    });

    switch (selectedFrequency) {
      case "everyday":
        formatedSelectedFrequency = "Every Day";
        break;
      case "every3days":
        formatedSelectedFrequency = "Every 3 Days";
        break;
      case "onceaweek":
        formatedSelectedFrequency = "Once a Week";
        break;
      case "onceamonth":
        formatedSelectedFrequency = "Once a Month";
        break;
    }
  }

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
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: Dimensions.height * 0.025),
              child: GestureDetector(
                onTap: () {
                  showGeneralDialog(
                      context: context,
                      barrierDismissible: true,
                      barrierLabel: MaterialLocalizations.of(context)
                          .modalBarrierDismissLabel,
                      barrierColor: Colors.black.withOpacity(0.5),
                      transitionDuration: const Duration(milliseconds: 0),
                      pageBuilder: (BuildContext context,
                          Animation animation,
                          Animation secondaryAnimation) {
                        return FrequencyDialogueBox(callback: updateSelectedFrequency, currentSelectedFrequency: selectedFrequency,);
                      });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      formatedSelectedFrequency,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Dimensions.width * 0.05,
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                      size: Dimensions.width * 0.07,
                    ),
                  ],
                ),
              ),
            )),
        Positioned(
          top: 0,
          left: 15,
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
