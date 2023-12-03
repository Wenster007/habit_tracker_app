import 'package:flutter/material.dart';
import 'package:habit_tracker/widgets/TopHeaderIcons.dart';

import '../Utils/dimensions.dart';
import 'heading_text.dart';


class HomeScreenTopHeader extends StatelessWidget {
  const HomeScreenTopHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Dimensions.height * 0.075,
      decoration: BoxDecoration(
        color: Colors.black87.withOpacity(0.9),
      ),
      // alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const HeadingText(text: "Habits"),
            SizedBox(
              width: Dimensions.width * 0.35,
              child: const TopHeaderIcons(),
            ),
          ],
        ),
      ),
    );
  }
}
