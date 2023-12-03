import 'package:flutter/material.dart';

class FrequencyDialogueBox extends StatefulWidget {

  final void Function(String) callback;

  const FrequencyDialogueBox({Key? key, required this.callback}) : super(key: key);


  @override
  State<FrequencyDialogueBox> createState() => _FrequencyDialogueBoxState();
}

class _FrequencyDialogueBoxState extends State<FrequencyDialogueBox> {

  String selectedValue = 'everyday';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
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
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
