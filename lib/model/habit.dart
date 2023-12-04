import 'dart:ui';

enum Frequency {oneday , oncethreedays, onceaweek, onceamonth}

class Habit {
  final bool isMeasurable;
  final Quantity? quantity;
  final String name;
  final Color color;
  final Frequency frequency;
  final DateTime? reminder;
  final Map<DateTime, Result>? listCompletedTaskDays = {};

  Habit(
      {required this.isMeasurable,
      this.quantity,
      required this.name,
      required this.color,
      required this.frequency,
      this.reminder,
      });


  addNewCompletedTask(Result result) {
    listCompletedTaskDays!.putIfAbsent(result.dateTime, () => result);
  }

}

class Result {
  final bool isTargetCompleted;
  final DateTime dateTime;
  final String value;

  Result({required this.isTargetCompleted, required this.dateTime, required this.value});
}

class Quantity {
  final String unit;
  final String target;

  Quantity({required this.unit,required this.target});
}