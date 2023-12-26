
import 'package:get/get.dart';

import '../model/habit.dart';

class HabitRepo {
  List<Habit> listOfHabits = [];

  void createHabit(Habit newHabit) {
    if (!listOfHabits.contains(newHabit)) {
      listOfHabits.add(newHabit);
    }
  }

  //for adding or removing date in YesNo habit.
  void addRemoveDateInYesNoHabit(DateTime currDate, Habit habit) {
    String formatedDate = "${currDate.day}-${currDate.month}-${currDate.year}";
    bool isDatePresent = habit.listCompletedTaskDays
        .any((completedDay) => completedDay.date == formatedDate);

    if (isDatePresent) {
      habit.listCompletedTaskDays
          .removeWhere((completedDay) => completedDay.date == formatedDate);
    } else {
      habit.listCompletedTaskDays.add(CompletedDay(formatedDate, null));
    }
  }

  List<Habit> getListOfHabits() {
    return listOfHabits;
  }

  //to check how much weekly target has been met. Will have to change for
  //measurable.
  double getWeeklyReport(DateTime currDate, Habit habit) {
    RxDouble totalWeeklyProgress = RxDouble(0.0);

    for (int i = 0; i < 7; i++) {
      if (checkDateCompleted(currDate.subtract(Duration(days: i)), habit)) {
        totalWeeklyProgress.value += 1;
      }
    }

    return totalWeeklyProgress.value / 7;
  }

  bool checkDateCompleted(DateTime currDate, Habit habit) {
    String formatedDate = "${currDate.day}-${currDate.month}-${currDate.year}";
    bool isDatePresent = habit.listCompletedTaskDays
        .any((completedDay) => completedDay.date == formatedDate);

    if (isDatePresent) {
      return true;
    } else {
      return false;
    }
  }

//---------------------------------------------
//Indirect Functions
}
