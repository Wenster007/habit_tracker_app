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

  void addRemoveDateInYesNoHabit(DateTime date, Habit habit) {
    habitRepo.addRemoveDateInYesNoHabit(date, habit);
    update();
  }

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