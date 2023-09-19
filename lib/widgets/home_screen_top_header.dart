import 'package:flutter/material.dart';
import 'package:habit_tracker/widgets/add_dialog_box.dart';

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
        padding: const EdgeInsets.only(left: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const HeadingText(text: "Habits"),
            SizedBox(
              width: Dimensions.width * 0.35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyIcon(
                      iconData: Icons.add,
                      onPressed: () {
                        showGeneralDialog(
                            context: context,
                            barrierDismissible: true,
                            barrierLabel: MaterialLocalizations.of(context)
                                .modalBarrierDismissLabel,
                            barrierColor: Colors.black.withOpacity(0.5),
                            transitionDuration: const Duration(milliseconds: 0),
                            pageBuilder: (BuildContext context,
                                Animation animation,
                                Animation secondaryAnimation) {
                              return const AddDialogueBox();
                            });
                      }),
                  MyIcon(iconData: Icons.menu, onPressed: () {}),
                  MyIcon(iconData: Icons.more_vert, onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
