import 'package:flutter/material.dart';

import '../Utils/dimensions.dart';
import '../Utils/main_colors.dart';
import 'day_date_tile.dart';

class DateRow extends StatelessWidget {
  const DateRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height * 0.075,
      color: MainColors.mainDarkBrown.withOpacity(0.93),
      alignment: Alignment.center,
      child: Row(
        children: [
          Container(
            width: Dimensions.width * 0.5,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return DayDateTile(
                  index: index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
