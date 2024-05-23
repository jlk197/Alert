import 'package:alert/models/entities/pill_entity.dart';
import 'package:alert/models/meal.dart';

class Pill {
  final int id;
  final String name;
  final bool isTaken;
  final String meal;
  final String comment;
  Pill(
      {this.id = -1,
      this.name = "",
      this.isTaken = false,
      this.meal = "",
      this.comment = ""});

  static Pill formEntity(PillEntity entity, bool isTaken) {
    return Pill(
        id: entity.id,
        name: "${entity.dosage} ${entity.capacity} - ${entity.name}",
        isTaken: isTaken,
        meal: entity.meal.toPolishString(),
        comment: entity.comment);
  }
}
