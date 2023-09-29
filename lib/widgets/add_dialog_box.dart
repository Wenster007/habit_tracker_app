import 'package:flutter/material.dart';
import 'package:habit_tracker/screens/yes_no_adding_screen.dart';

import '../Utils/dimensions.dart';
import '../Utils/main_colors.dart';

class AddDialogueBox extends StatelessWidget {
  const AddDialogueBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => YesNoAddScreen(),));
            },
            child: Container(
              margin:
              EdgeInsets.symmetric(horizontal: Dimensions.height * 0.01),
              padding:
              EdgeInsets.all(Dimensions.height * 0.03),
              width: double.infinity,
              decoration: BoxDecoration(
                color:
                MainColors.lightBrown.withOpacity(0.9),
                border: Border.all(
                  color: Colors.white,
                  width: 3,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    Dimensions.height * 0.01,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Yes or No",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.white,
                      fontSize: Dimensions.height * 0.03,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                  SizedBox(height: Dimensions.height * 0.02,),
                  Text("e.g. Did you wake up early today? Did you exercise? Did you play chess?",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.white,
                      fontSize: Dimensions.height * 0.02,
                      fontWeight: FontWeight.w500,
                    ),),
                ],
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.height * 0.01,
          ),
          Container(
            margin:
            EdgeInsets.symmetric(horizontal : Dimensions.height * 0.01),
            padding:
            EdgeInsets.all(Dimensions.height * 0.03),
            width: double.infinity,
            decoration: BoxDecoration(
              color:
              MainColors.lightBrown.withOpacity(0.9),
              border: Border.all(
                color: Colors.white,
                width: 3,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  Dimensions.height * 0.01,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Measurable",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontSize: Dimensions.height * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: Dimensions.height * 0.02,),
                Text("e.g. How many miles did you run today? How many pages did you read today?",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontSize: Dimensions.height * 0.02,
                    fontWeight: FontWeight.w500,
                  ),),
              ],
            ),
          ),
        ],
      ),
    ); // Your custom overlay content widget
  }
}
