import 'package:flutter/material.dart';

import '../Utils/main_colors.dart';

class FrequencyDialogueBox extends StatefulWidget {

  final void Function(String) callback;
  final String currentSelectedFrequency;

  const FrequencyDialogueBox({Key? key, required this.callback, required this.currentSelectedFrequency}) : super(key: key);


  @override
  State<FrequencyDialogueBox> createState() => _FrequencyDialogueBoxState();
}

class _FrequencyDialogueBoxState extends State<FrequencyDialogueBox> {


  @override
  Widget build(BuildContext context) {
    String selectedValue = widget.currentSelectedFrequency;

    return Center(
      child: Material(
        child: Container(
          color: MainColors.grayColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: RadioListTile(
                    title: const Text("Every Day"),
                    value: "everyday",
                    groupValue: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value!;
                        widget.callback(value);
                        Navigator.pop(context);
                      });
                    }),
              ),
              ListTile(
                title: RadioListTile(
                    title: const Text("Every 3 Days"),
                    value: "every3days",
                    groupValue: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value!;
                        widget.callback(value);
                        Navigator.pop(context);
                      });
                    }),
              ),
              ListTile(
                title: RadioListTile(
                    title: const Text("Once a Week"),
                    value: "onceaweek",
                    groupValue: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value!;
                        widget.callback(value);
                        Navigator.pop(context);
                      });
                    }),
              ),
              ListTile(
                title: RadioListTile(
                    title: const Text("Once a Month"),
                    value: "onceamonth",
                    groupValue: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value!;
                        widget.callback(value);
                        Navigator.pop(context);
                      });
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
