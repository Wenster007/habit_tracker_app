import 'package:flutter/material.dart';
import 'package:habit_tracker/Utils/dimensions.dart';
import 'package:habit_tracker/Utils/main_colors.dart';
import 'package:habit_tracker/widgets/choose_color_field.dart';
import 'package:habit_tracker/widgets/custom_textfield.dart';
import 'package:habit_tracker/widgets/yes_no_top_appbar.dart';

class YesNoAddScreen extends StatelessWidget {
  YesNoAddScreen({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController questionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.lightBrown,
      body: SafeArea(
        child: Column(
          children: [
            const TopAppbar(),
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          textEditingController: nameController,
                          nameOfTextField: "Name",
                          hintText: "e.g. Exercise",
                        ),
                      ),

                      SizedBox(width: Dimensions.width * 0.02,),

                      const ChooseColorField(nameOfTextField: "Color"),
                    ],
                  ),
                  SizedBox(height: Dimensions.height * 0.006,),
                  CustomTextField(textEditingController: questionController, nameOfTextField: "Question", hintText: "e.g. Did you exercise today?")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
