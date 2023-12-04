import 'package:flutter/material.dart';
import 'package:habit_tracker/Utils/dimensions.dart';
import 'package:habit_tracker/Utils/main_colors.dart';
import 'package:habit_tracker/widgets/heading_text.dart';

class ColorDialogueBox extends StatefulWidget {
  const ColorDialogueBox({Key? key, required this.onColorChange}) : super(key: key);

  final void Function(Color) onColorChange;

  @override
  State<ColorDialogueBox> createState() => _ColorDialogueBoxState();
}

class _ColorDialogueBoxState extends State<ColorDialogueBox> {
  List<Color> listOfColors = [
    Colors.red,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.tealAccent,
    Colors.black87,
    Colors.grey,
  ];


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        child: Container(
          color: MainColors.grayColor,
          width: Dimensions.width * 0.87,
          height: Dimensions.height * 0.4,
          padding: EdgeInsets.symmetric(horizontal: Dimensions.width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: Dimensions.height * 0.03,
              ),
              const HeadingText(text: "Change Color"),
              SizedBox(
                height: Dimensions.height * 0.03,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: listOfColors.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        widget.onColorChange(listOfColors[index]);
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: Dimensions.height * 0.02,
                        height: Dimensions.height * 0.02,
                        decoration: BoxDecoration(
                          color: listOfColors[index],
                            borderRadius:
                                BorderRadius.circular(Dimensions.height * 0.015)),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
