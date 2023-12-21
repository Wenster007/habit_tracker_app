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
    required this.addRemoveDateInHabit,
    required this.habit,
    required this.scrollController,
    required this.checkDateCompleted,
    required this.getWeeklyReport,
  }) : super(key: key);

  @override
  State<HabitTile> createState() => _HabitTileState();

  final void Function(DateTime, Habit) addRemoveDateInHabit;
  final bool Function(DateTime, Habit) checkDateCompleted;
  final double Function(DateTime, Habit) getWeeklyReport;
  final ScrollController scrollController;

  final Habit habit;
}

class _HabitTileState extends State<HabitTile> {
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
            margin: EdgeInsets.symmetric(horizontal: Dimensions.height * 0.013),
            width: Dimensions.height * 0.03,
            height: Dimensions.height * 0.03,
            child: CustomCircularProgressIndicator(
              progress: widget.getWeeklyReport(DateTime.now(), widget.habit),

              color: widget.habit.color,
            ),
          ),
          Container(
            width: Dimensions.width * 0.4,
            child: Text(widget.habit.name,
                style: TextStyle(
                  color: widget.habit.color,
                  fontWeight: FontWeight.w400,
                  fontSize: Dimensions.width * 0.043,
                  letterSpacing: 2,
                )),
          ),
          Expanded(
            child: ListView.builder(
              controller: widget.scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (context, index) {
                return GetBuilder<HabitController>(
                  builder: (controller) {
                    return IconButton(
                      onPressed: () {
                        DateTime dateTime = DateTime.now();
                        final currDateTime =
                            dateTime.subtract(Duration(days: index));

                          widget.addRemoveDateInHabit(
                              currDateTime, widget.habit);
                      },
                      icon: Icon(
                        Icons.check,
                        color: widget.checkDateCompleted(
                                DateTime.now().subtract(Duration(days: index)),
                                widget.habit)
                            ? widget.habit.color
                            : Colors.grey.withOpacity(0.6),
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
