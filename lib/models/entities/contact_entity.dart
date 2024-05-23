import 'package:isar/isar.dart';

part 'contact_entity.g.dart';

@collection
class ContactEntity {
  Id id = Isar.autoIncrement;
  String name;
  String number;
  ContactEntity({this.name = "", this.number = ""});
}
