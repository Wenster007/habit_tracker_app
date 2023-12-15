import '../model/habit.dart';

class HabitRepo{
  List<Habit> listOfHabits = [];

  void createHabit(Habit newHabit) {
    if (!listOfHabits.contains(newHabit)){
      listOfHabits.add(newHabit);
    }
  }

  void addRemoveDateInHabit(DateTime date, Habit habit) {
    if (!habit.listCompletedTaskDays.contains("${date.day}-${date.month}-${date.year}")) {
      habit.listCompletedTaskDays.add("${date.day}-${date.month}-${date.year}");
    } else {
      habit.listCompletedTaskDays.remove("${date.day}-${date.month}-${date.year}");
    }
  }

  // Result? getResultOfDateInHabit(DateTime targetDateTime, Habit habit) {
  //   for (var entry in habit.listCompletedTaskDays.entries) {
  //     if (entry.key == targetDateTime) {
  //       return entry.value;
  //     }
  //   }
  //   return null; // Not found
  // }

  List<Habit> getListOfHabits(){
    return listOfHabits;
  }

  bool checkDateCompleted(DateTime givenDateTime, Habit habit) {
    if (habit.listCompletedTaskDays.contains("${givenDateTime.day}-${givenDateTime.month}-${givenDateTime.year}")) {
      return true;
    } else {
      return false;
    }
  }



  //---------------------------------------------
  //Indirect Functions

}