import 'package:flutter/material.dart';
import 'package:habit_tracker/Utils/dimensions.dart';
import 'package:habit_tracker/Utils/main_colors.dart';
import 'package:get/get.dart';
import 'package:habit_tracker/controller/habit_controller.dart';
import 'package:habit_tracker/model/habit.dart';
import 'package:habit_tracker/widgets/choose_color_field.dart';
import 'package:habit_tracker/widgets/custom_dropdown.dart';
import 'package:habit_tracker/widgets/custom_textfield.dart';
import 'package:habit_tracker/widgets/yes_no_top_appbar.dart';

class YesNoAddScreen extends StatefulWidget {
  YesNoAddScreen({Key? key}) : super(key: key);

  @override
  State<YesNoAddScreen> createState() => _YesNoAddScreenState();
}

class _YesNoAddScreenState extends State<YesNoAddScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController questionController = TextEditingController();
  Color selectedColor = Colors.red;
  String frequency = "everyday";

  final habitController = Get.find<HabitController>();

  void onChangeColor(Color newColor) {
    selectedColor = newColor;
  }

  void onChangeFrequency(String newFrequency) {
    frequency = newFrequency;
  }

  void onClickSave() {
    if (nameController.text != "" && questionController.text != "") {
      habitController.createHabit(Habit(
          isMeasurable: false,
          name: nameController.text,
          color: selectedColor,
          frequency: frequency,
          question: questionController.text));

      habitController.updateNumberOfHabits();

      Navigator.pop(context);
    } else {
      Get.defaultDialog(
        title: "Error",
        titleStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        content: const Text("Please enter the required information.", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.lightBrown,
      body: SafeArea(
        child: Column(
          children: [
            TopAppbar(onClickSave: onClickSave),
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
                top: 8,
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
                      SizedBox(
                        width: Dimensions.width * 0.02,
                      ),
                      ChooseColorField(
                          nameOfTextField: "Color",
                          onChangeColor: onChangeColor),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.height * 0.006,
                  ),
                  CustomTextField(
                      textEditingController: questionController,
                      nameOfTextField: "Question",
                      hintText: "e.g. Did you exercise today?"),
                  SizedBox(
                    height: Dimensions.height * 0.006,
                  ),
                  CustomDropDown(
                      nameOfTextField: "Frequency",
                      onChangeFrequency: onChangeFrequency),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
