import 'dart:ui';

class Habit {
  final bool isMeasurable;
  final Quantity? quantity;
  final String name;
  final String question;
  final Color color;
  final String frequency;
  final DateTime? reminder;
  final Map<DateTime, Result> listCompletedTaskDays = {};

  Habit(
      {required this.isMeasurable,
      this.quantity,
      required this.name,
        required this.question,
      required this.color,
      required this.frequency,
      this.reminder,
      });
}

class Result {
  late final bool isTargetCompleted;
  final String? value;

  Result({required this.isTargetCompleted, this.value});

  void toggleResult(){
    isTargetCompleted = !isTargetCompleted;
  }
}

class Quantity {
  final String unit;
  final String target;

  Quantity({required this.unit,required this.target});
}