import 'package:get/get.dart';

import '../model/habit.dart';

class HabitRepo {
  List<Habit> listOfHabits = [];

  void createHabit(Habit newHabit) {
    if (!listOfHabits.contains(newHabit)) {
      listOfHabits.add(newHabit);
    }
  }

  void addRemoveDateInHabit(DateTime date, Habit habit) {
    if (!habit.listCompletedTaskDays
        .contains("${date.day}-${date.month}-${date.year}")) {
      habit.listCompletedTaskDays.add("${date.day}-${date.month}-${date.year}");
    } else {
      habit.listCompletedTaskDays
          .remove("${date.day}-${date.month}-${date.year}");
    }
  }

  List<Habit> getListOfHabits() {
    return listOfHabits;
  }

  //to check how much weekly target has been met. Will have to change for
  //measurable.
  double getWeeklyReport(DateTime currDate, Habit habit) {
    RxDouble totalWeeklyProgress = RxDouble(0.0);


    for (int i=0; i<7; i++){
      if (checkDateCompleted(currDate.subtract(Duration(days: i)), habit)) {
        totalWeeklyProgress.value  += 1;
      }
    }

    return totalWeeklyProgress.value / 7;
  }

  bool checkDateCompleted(DateTime givenDateTime, Habit habit) {
    if (habit.listCompletedTaskDays.contains(
        "${givenDateTime.day}-${givenDateTime.month}-${givenDateTime.year}")) {
      return true;
    } else {
      return false;
    }
  }

//---------------------------------------------
//Indirect Functions
}
