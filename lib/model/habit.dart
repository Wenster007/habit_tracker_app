import 'dart:ui';

class Habit {
  final bool isMeasurable;
  final Quantity? quantity;
  final String name;
  final String question;
  final Color color;
  final String frequency;
  final DateTime? reminder;
  final List<String> listCompletedTaskDays = [];

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


class Quantity {
  final String unit;
  final String target;

  Quantity({required this.unit,required this.target});
}