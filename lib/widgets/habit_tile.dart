import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit_tracker/controller/habit_controller.dart';
import 'package:habit_tracker/model/habit.dart';

import '../Utils/dimensions.dart';
import '../Utils/main_colors.dart';

class HabitTile extends StatefulWidget {
  const HabitTile({
    Key? key,
    required this.addRemoveDateInHabit,
    required this.habit,
    required this.scrollController, required this.checkDateCompleted,
  }) : super(key: key);

  @override
  State<HabitTile> createState() => _HabitTileState();

  final void Function(DateTime, Habit) addRemoveDateInHabit;
  final bool Function(DateTime, Habit) checkDateCompleted;
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
            width: Dimensions.width * 0.5,
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width * 0.06),
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
              itemCount: 6,
              itemBuilder: (context, index) {
                return GetBuilder<HabitController>(
                  builder: (controller) {
                    return IconButton(
                      onPressed: () {
                        DateTime dateTime = DateTime.now();
                        final currDateTime =
                            dateTime.subtract(Duration(days: index));
                        setState(() {
                          widget.addRemoveDateInHabit(currDateTime, widget.habit);
                        });
                      },
                      icon: Icon(
                        Icons.check,
                        color: widget.checkDateCompleted(DateTime.now().subtract(Duration(days: index)), widget.habit) ? widget.habit.color : Colors.grey,
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
