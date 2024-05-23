import 'package:alert/models/dosage_frequency.dart';
import 'package:alert/models/meal.dart';
import 'package:isar/isar.dart';

part 'pill_entity.g.dart';

@collection
class PillEntity {
  Id id = Isar.autoIncrement;
  String name;
  DateTime? startDate;
  DateTime? stopDate;
  List<String> hour;
  @enumerated
  DosageFrequency frequency;
  int? weeklyFrequencyValue;
  int? intervalFrequencyValue;
  int dosage;
  String capacity;
  @enumerated
  Meal meal;
  String comment;
  PillEntity(
      {this.capacity = "",
      this.comment = "",
      this.dosage = 1,
      this.frequency = DosageFrequency.daily,
      this.intervalFrequencyValue = 2,
      this.hour = const [],
      this.meal = Meal.after,
      this.name = "",
      this.startDate,
      this.stopDate,
      this.weeklyFrequencyValue});

  /* DosageFrequency getFreqType() { //TODO
    if (intervalFrequencyValue != null) {
      return DosageFrequency.interval;
    } else if (weeklyFrequencyValue != null) {
      return DosageFrequency.weekly;
    } else {
      return DosageFrequency.daily;
    }
  }*/
}
