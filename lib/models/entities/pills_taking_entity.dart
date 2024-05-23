import 'package:isar/isar.dart';

part 'pills_taking_entity.g.dart';

@collection
class PillsTakingEntity {
  Id id = Isar.autoIncrement;
  int pillId;
  DateTime date;
  String hour;
  bool isTaken;
  PillsTakingEntity(
      {required this.date,
      this.hour = "",
      this.pillId = -1,
      this.isTaken = false});
}
