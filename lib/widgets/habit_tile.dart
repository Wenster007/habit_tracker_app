import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit_tracker/controller/habit_controller.dart';
import 'package:habit_tracker/model/habit.dart';
import 'package:habit_tracker/widgets/custom_circular_progress_indicator.dart';

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
  }) : super(key: key);

  @override
  State<HabitTile> createState() => _HabitTileState();

  final void Function(DateTime, Habit) addRemoveDateInYesNoHabit;
  final bool Function(DateTime, Habit) checkDateCompleted;
  final double Function(DateTime, Habit) getWeeklyReport;
  final ScrollController scrollController;

  final Habit habit;
}

class _HabitTileState extends State<HabitTile> {
  //todo: change the habit tile for measurable habit and make it interactive.

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
              progress: widget.getWeeklyReport(DateTime.now(), widget.habit),
              color: widget.habit.color,
            ),
          ),
          Container(
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
                        ? Container(
                            width: Dimensions.width * 0.13,
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "0.0",
                                  style: TextStyle(
                                      color: Colors.grey.withOpacity(0.4),
                                      fontWeight: FontWeight.w800,
                                      fontSize: Dimensions.height * 0.02),
                                ),
                                Text(
                                  widget.habit.quantity!.unit,
                                  style: TextStyle(
                                      color: Colors.grey.withOpacity(0.4),
                                      fontWeight: FontWeight.w500,
                                      fontSize: Dimensions.height * 0.015),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            // height: Dimensions.width * 0.03,
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
                          );

                    // : IconButton(
                    //     onPressed: () {
                    //       DateTime dateTime = DateTime.now();
                    //       final currDateTime =
                    //           dateTime.subtract(Duration(days: index));
                    //
                    //       widget.addRemoveDateInYesNoHabit(
                    //           currDateTime, widget.habit);
                    //     },
                    //     icon: Icon(
                    //       Icons.check,
                    //       color: widget.checkDateCompleted(
                    //               DateTime.now()
                    //                   .subtract(Duration(days: index)),
                    //               widget.habit)
                    //           ? widget.habit.color
                    //           : Colors.grey.withOpacity(0.6),
                    //     ),
                    //
                    //   );
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
