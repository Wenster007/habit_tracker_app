import 'package:flutter/material.dart';
import 'package:habit_tracker/widgets/grey_small_text.dart';

import '../Utils/dimensions.dart';

class DayDateTile extends StatelessWidget {
  const DayDateTile({Key? key, required this.index}) : super(key: key);

  final int index;

  String getWeekDay(int dayOfWeek) {
    String result = "";
    switch (dayOfWeek) {
      case 1:
        result = "Mon";
        break;
      case 2:
        result = "Tue";
        break;
      case 3:
        result = "Wed";
        break;
      case 4:
        result = "Thur";
        break;
      case 5:
        result = "Fri";
        break;
      case 6:
        result = "Sat";
        break;
      case 7:
        result = "Sun";
        break;
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.now();

    final currDateTime = dateTime.subtract(Duration(days: index));

    return Container(
      width: Dimensions.width * 0.13,
      // color: Colors.black,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GreySmallText(text: getWeekDay(currDateTime.weekday).toUpperCase(),),
          GreySmallText(text: currDateTime.day.toString()),
        ],
      ),
    );

  }
}
