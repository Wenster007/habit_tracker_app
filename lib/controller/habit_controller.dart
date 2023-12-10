import 'package:get/get.dart';
import 'package:habit_tracker/model/habit.dart';

import '../repository/habit_repo.dart';

class HabitController extends GetxController{
  final HabitRepo habitRepo;

  HabitController(this.habitRepo);

  void createHabit(Habit newHabit) {
    habitRepo.createHabit(newHabit);
  }

  List<Habit> getListOfHabits(){
    return habitRepo.getListOfHabits();
  }

  void addRemoveDateInHabit(DateTime date, Habit habit) {
    habitRepo.addRemoveDateInHabit(date, habit);
  }

  Result? getResultOfDateInHabit(DateTime targetDateTime, Habit habit) {
    return habitRepo.getResultOfDateInHabit(targetDateTime, habit);
  }

  void updateNumberOfHabits() {
    update();
  }
}