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

  void addRemoveForMeasurableHabit(
      DateTime currDate, Habit habit, String doneValue) {
    String formatedDate = "${currDate.day}-${currDate.month}-${currDate.year}";
    bool isDatePresent = habit.listCompletedTaskDays
        .any((completedDay) => completedDay.date == formatedDate);

    if (isDatePresent) {
      if (double.parse(doneValue) == 0.0) {
        //if the value is set to 0 it will be removed.
        print("removed the date");
        habit.listCompletedTaskDays
            .removeWhere((completedDay) => completedDay.date == formatedDate);
        return;
      }

      //if the date is already present then the value will be updated.
      for (var completedDay in habit.listCompletedTaskDays) {
        if (completedDay.date == formatedDate) {
          completedDay.doneTargetValue = doneValue.toString();
        }
      }
    } else if (double.parse(doneValue) == 0.0) {
      return;
    } else {
      //if the date is not present then the date will be added.
      habit.listCompletedTaskDays.add(CompletedDay(formatedDate, doneValue));
    }
  }

  //this function should only be used when you are confirm that the date is present.
  String? getDoneValueForMeasurableHabit(DateTime currDate, Habit habit) {
    String formatedDate = "${currDate.day}-${currDate.month}-${currDate.year}";

    for (var completedDay in habit.listCompletedTaskDays) {
      if (completedDay.date == formatedDate) {
        return completedDay.doneTargetValue;
      }
    }
    return null;
  }

  List<Habit> getListOfHabits() {
    return listOfHabits;
  }

  //to check how much weekly target has been met. Will have to change for
  //measurable.
  double getWeeklyReport(DateTime currDate, Habit habit) {
    RxDouble totalWeeklyProgress = RxDouble(0.0);

    for (int i = 0; i < 7; i++) {
      if (checkDatePresent(currDate.subtract(Duration(days: i)), habit)) {
        totalWeeklyProgress.value += 1;
      }
    }

    return totalWeeklyProgress.value / 7;
  }

  double getWeeklyReportForMeasurableHabit(DateTime date, Habit habit) {
    RxDouble totalWeeklyProgress = RxDouble(0.0);

    for (int i = 0; i < 7; i++) {
      final currDate = date.subtract(Duration(days: i));

      if (checkDatePresent(currDate, habit)) {
        totalWeeklyProgress.value +=
            double.parse(getDoneValueForMeasurableHabit(currDate, habit)!);
      }
    }

    double target = double.parse(habit.target!.targetValue);
    return totalWeeklyProgress.value / (target * 7);
  }

  bool checkDatePresent(DateTime currDate, Habit habit) {
    String formatedDate = "${currDate.day}-${currDate.month}-${currDate.year}";
    bool isDatePresent = habit.listCompletedTaskDays
        .any((completedDay) => completedDay.date == formatedDate);

    if (isDatePresent) {
      return true;
    } else {
      return false;
    }
  }
}
