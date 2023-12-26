import 'package:flutter/material.dart';
import 'package:habit_tracker/widgets/date_row.dart';
import 'package:habit_tracker/widgets/habit_tile.dart';
import '../controller/habit_controller.dart';
import '../widgets/home_screen_top_header.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController scrollController1 = ScrollController();
  final ScrollController scrollController2 = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController1.addListener(() {
      scrollController2.jumpTo(scrollController1.offset);
    });

  }

  @override
  Widget build(BuildContext context) {
    final habitController = Get.find<HabitController>();

    return Scaffold(
      backgroundColor: Colors.black87.withOpacity(0.9),
      body: SafeArea(
        child: Column(
          children: [
            const HomeScreenTopHeader(),
            DateRow(scrollController: scrollController1),
            GetBuilder<HabitController>(builder: (controller) {
              return Expanded(
                child: ListView.builder(
                  itemCount: habitController.getListOfHabits().length,
                  itemBuilder: (context, index) {
                    return HabitTile(
                      addRemoveDateInYesNoHabit: habitController.addRemoveDateInYesNoHabit,
                      checkDateCompleted: habitController.checkDateCompleted,
                      getWeeklyReport: habitController.getWeeklyReport,
                      scrollController: scrollController2,
                      habit: habitController.getListOfHabits()[index],
                    );
                  },
                ),
              );
            },),
          ],
        ),
      ),
    );
  }
}
