import 'dart:ui';

class Habit {
  final bool isMeasurable;
  final Target? target;
  final String name;
  final String question;
  final Color color;
  final String frequency;
  final DateTime? reminder;
  final List<CompletedDay> listCompletedTaskDays = [];

  Habit(
      {required this.isMeasurable,
      this.target,
      required this.name,
        required this.question,
      required this.color,
      required this.frequency,
      this.reminder,
      });
}

class CompletedDay{
  final String date;
  String? doneTargetValue;

  CompletedDay(this.date, this.doneTargetValue);
}

class Target {
  final String unit;
  final String targetValue;

  Target({required this.unit,required this.targetValue});
}