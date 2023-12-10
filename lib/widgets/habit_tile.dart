import 'package:flutter/material.dart';
import 'package:habit_tracker/model/habit.dart';

import '../Utils/dimensions.dart';
import '../Utils/main_colors.dart';

class HabitTile extends StatefulWidget {
  const HabitTile({Key? key, required this.addRemoveDateInHabit, required this.habit,  required this.getResultOfDateInHabit, required this.scrollController}) : super(key: key);

  @override
  State<HabitTile> createState() => _HabitTileState();

  final void Function(DateTime, Habit) addRemoveDateInHabit;
  final void Function(DateTime, Habit) getResultOfDateInHabit;
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
            child: Text(widget.habit.name, style: TextStyle(color: widget.habit.color)),
          ),
          Expanded(
            child: ListView.builder(
              controller: widget.scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return IconButton(
                    onPressed: () {
                      DateTime dateTime = DateTime.now();
                      final currDateTime = dateTime.subtract(Duration(days: index));
                      widget.addRemoveDateInHabit(currDateTime, widget.habit);

                      //todo: get result and display color accordingly of the habit.
                      //todo: also add the same scrolling effect.
                    },
                    icon: Icon(
                      Icons.check,
                      // color: iconColor.withOpacity(0.5),
                    ),);
              },
            ),
          ),
        ],
      ),
    );
  }
}
