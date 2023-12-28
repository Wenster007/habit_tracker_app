import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit_tracker/controller/habit_controller.dart';
import 'package:habit_tracker/model/habit.dart';
import 'package:habit_tracker/widgets/custom_circular_progress_indicator.dart';
import 'package:vibration/vibration.dart';

import '../Utils/dimensions.dart';
import '../Utils/main_colors.dart';

class HabitTile extends StatefulWidget {
  const HabitTile({
    Key? key,
    required this.addRemoveDateInYesNoHabit,
    required this.habit,
    required this.scrollController,
    required this.checkDateCompleted,
    required this.getWeeklyReport,
    required this.addRemoveForMeasurableHabit,
    required this.getDoneValueForMeasurableHabit,
    required this.getWeeklyReportForMeasurableHabit,
  }) : super(key: key);

  @override
  State<HabitTile> createState() => _HabitTileState();

  final void Function(DateTime, Habit) addRemoveDateInYesNoHabit;
  final bool Function(DateTime, Habit) checkDateCompleted;
  final String? Function(DateTime, Habit) getDoneValueForMeasurableHabit;
  final double Function(DateTime, Habit) getWeeklyReport;
  final double Function(DateTime, Habit) getWeeklyReportForMeasurableHabit;
  final void Function(DateTime, Habit, String) addRemoveForMeasurableHabit;
  final ScrollController scrollController;

  final Habit habit;
}

class _HabitTileState extends State<HabitTile> {
  //todo: change the color for measurable habits.
  //todo: simplify the code.

  Future<void> _showInputDialogue(BuildContext context, DateTime date) {
    TextEditingController textController = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Enter Value",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black.withOpacity(0.7),
          content: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: Dimensions.width * 0.35,
                child: TextField(
                  controller: textController,
                  decoration: InputDecoration(
                    hintText: '0',
                    hintStyle: const TextStyle(color: Colors.grey),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.white.withOpacity(0.3)),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                width: Dimensions.width * 0.03,
              ),
              GestureDetector(
                onTap: () {
                  widget.addRemoveForMeasurableHabit(
                      date, widget.habit, textController.text);
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: Dimensions.width * 0.25,
                  height: Dimensions.height * 0.05,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 1)),
                  child: Text(
                    "Save",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: Dimensions.width * 0.048,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.height * 0.007),
      height: Dimensions.height * 0.075,
      color: MainColors.mainDarkBrown.withOpacity(0.93),
      alignment: Alignment.center,
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            width: Dimensions.width * 0.095,
            height: Dimensions.height * 0.03,
            child: CustomCircularProgressIndicator(
              progress: widget.habit.isMeasurable
                  ? widget.getWeeklyReportForMeasurableHabit(DateTime.now(), widget.habit)
                  : widget.getWeeklyReport(DateTime.now(), widget.habit),
              color: widget.habit.color,
            ),
          ),
          SizedBox(
            width: Dimensions.width * 0.405,
            child: Text(
              widget.habit.name,
              style: TextStyle(
                color: widget.habit.color,
                fontWeight: FontWeight.w400,
                fontSize: Dimensions.width * 0.043,
                letterSpacing: 2,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: widget.scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (context, index) {
                return GetBuilder<HabitController>(
                  builder: (controller) {
                    return widget.habit.isMeasurable
                        ? GestureDetector(
                            onLongPress: () {
                              Vibration.vibrate(duration: 50, amplitude: 50);
                              _showInputDialogue(
                                  context,
                                  DateTime.now()
                                      .subtract(Duration(days: index)));
                              // Navigator.pop(context);
                            },
                            child: Container(
                              width: Dimensions.width * 0.13,
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    widget.checkDateCompleted(
                                            DateTime.now().subtract(
                                                Duration(days: index)),
                                            widget.habit)
                                        ? widget.getDoneValueForMeasurableHabit(
                                            DateTime.now().subtract(
                                                Duration(days: index)),
                                            widget.habit)!
                                        : "0.0",
                                    style: TextStyle(
                                        color: Colors.grey.withOpacity(0.4),
                                        fontWeight: FontWeight.w800,
                                        fontSize: Dimensions.height * 0.02),
                                  ),
                                  Text(
                                    widget.habit.target!.unit,
                                    style: TextStyle(
                                        color: Colors.grey.withOpacity(0.4),
                                        fontWeight: FontWeight.w500,
                                        fontSize: Dimensions.height * 0.015),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : GestureDetector(
                            onLongPress: () {
                              Vibration.vibrate(duration: 50, amplitude: 50);
                              widget.addRemoveDateInYesNoHabit(
                                  DateTime.now()
                                      .subtract(Duration(days: index)),
                                  widget.habit);
                            },
                            child: Container(
                              width: Dimensions.width * 0.13,
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.check,
                                color: widget.checkDateCompleted(
                                        DateTime.now()
                                            .subtract(Duration(days: index)),
                                        widget.habit)
                                    ? widget.habit.color
                                    : Colors.grey.withOpacity(0.6),
                              ),
                            ),
                          );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
