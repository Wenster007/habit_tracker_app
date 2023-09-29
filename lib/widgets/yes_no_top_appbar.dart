import 'package:flutter/material.dart';

import '../Utils/dimensions.dart';
import 'heading_text.dart';

class TopAppbar extends StatelessWidget {
  const TopAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Dimensions.height * 0.09,
      decoration: BoxDecoration(color: Colors.black54),
      child: Padding(
        padding: const EdgeInsets.only(right: 12, left: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                    size: Dimensions.height * 0.038,
                  ),
                ),
                SizedBox(
                  width: Dimensions.width * 0.04,
                ),
                const HeadingText(text: "Create habit"),
              ],
            ),
            Container(
              width: Dimensions.width * 0.25,
              height: Dimensions.height * 0.05,
              decoration: BoxDecoration(
                // color: Colors.red,
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    Dimensions.height * 0.006,
                  ),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                "Save",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Dimensions.height * 0.025,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
