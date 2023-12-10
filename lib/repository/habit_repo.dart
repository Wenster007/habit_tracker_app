import '../model/habit.dart';

class HabitRepo{
  List<Habit> listOfHabits = [];

  void createHabit(Habit newHabit) {
    if (!listOfHabits.contains(newHabit)){
      listOfHabits.add(newHabit);
    }
  }

  void addRemoveDateInHabit(DateTime date, Habit habit) {
    for (var entry in habit.listCompletedTaskDays.entries) {
      if (entry.key == date) {
        entry.value.toggleResult();
      }
    }
  }

  Result? getResultOfDateInHabit(DateTime targetDateTime, Habit habit) {
    for (var entry in habit.listCompletedTaskDays.entries) {
      if (entry.key == targetDateTime) {
        return entry.value;
      }
    }
    return null; // Not found
  }

  List<Habit> getListOfHabits(){
    return listOfHabits;
  }



  //---------------------------------------------
  //Indirect Functions

}