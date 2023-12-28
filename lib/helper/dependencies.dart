import 'package:get/get.dart';
import 'package:habit_tracker/controller/habit_controller.dart';
import 'package:habit_tracker/repository/habit_repo.dart';

void init() {
  //repo
  Get.lazyPut(() => HabitRepo());

  //controller
  Get.lazyPut(() => HabitController(Get.find<HabitRepo>()));
}