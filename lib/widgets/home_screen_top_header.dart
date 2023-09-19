import 'package:flutter/material.dart';

import '../Utils/dimensions.dart';
import 'heading_text.dart';
import 'myIcon.dart';

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
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const HeadingText(text: "Habits"),
            Container(
              width: Dimensions.width * 0.4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyIcon(iconData: Icons.add, onPressed: (){}),
                  MyIcon(iconData: Icons.menu, onPressed: (){}),
                  MyIcon(iconData: Icons.more_vert, onPressed: (){}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
