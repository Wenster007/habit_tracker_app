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

  void addRemoveForMeasurableHabit(DateTime currDate, Habit habit, String doneValue){
    habitRepo.addRemoveForMeasurableHabit(currDate, habit, doneValue);
    update();
  }

  String? getDoneValueForMeasurableHabit(DateTime currDate, Habit habit){
    return habitRepo.getDoneValueForMeasurableHabit(currDate, habit);
  }

  double getWeeklyReport(DateTime currDate, Habit habit){
    return habitRepo.getWeeklyReport(currDate, habit);
  }

  double getWeeklyReportForMeasurableHabit(DateTime date, Habit habit) {
    return habitRepo.getWeeklyReportForMeasurableHabit(date, habit);
  }

  void updateNumberOfHabits() {
    update();
  }

  bool checkDateCompleted(DateTime targetDateTime, Habit habit) {
    return habitRepo.checkDatePresent(targetDateTime, habit);
  }
}