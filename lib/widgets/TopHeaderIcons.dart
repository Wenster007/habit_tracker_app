import 'package:flutter/material.dart';

import 'add_dialog_box.dart';
import 'myIcon.dart';

class TopHeaderIcons extends StatelessWidget {
  const TopHeaderIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
        MyIcon(iconData: Icons.menu, onPressed: () {
        }),
        MyIcon(iconData: Icons.more_vert, onPressed: () {}),
      ],
    );
  }
}
