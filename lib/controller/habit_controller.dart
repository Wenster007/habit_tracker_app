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
    update();
  }

  // Result? getResultOfDateInHabit(DateTime targetDateTime, Habit habit) {
  //   return habitRepo.getResultOfDateInHabit(targetDateTime, habit);
  // }

  double getWeeklyReport(DateTime currDate, Habit habit){
    return habitRepo.getWeeklyReport(currDate, habit);
  }

  void updateNumberOfHabits() {
    update();
  }

  bool checkDateCompleted(DateTime targetDateTime, Habit habit) {
    return habitRepo.checkDateCompleted(targetDateTime, habit);
  }
}