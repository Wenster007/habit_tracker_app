import 'package:flutter/material.dart';
import 'package:habit_tracker/Utils/dimensions.dart';
import 'package:habit_tracker/Utils/main_colors.dart';
import 'package:habit_tracker/widgets/day_date_tile.dart';

import '../widgets/home_screen_top_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const HomeScreenTopHeader(),
            Container(
              height: Dimensions.height * 0.075,
              color: MainColors.mainDarkBrown.withOpacity(0.93),
              alignment: Alignment.center,
              child: Row(
                children: [
                  Container(
                    width: Dimensions.width * 0.5,
                    // color: Colors.red,
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return DayDateTile(
                          index: index,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
