import 'package:isar/isar.dart';

part 'address_entity.g.dart';

@collection
class AddressEntity {
  Id id = Isar.autoIncrement;
  String postalCode;
  String city;
  String street;
  String houseNumer;
  AddressEntity(
      {this.postalCode = "",
      this.city = "",
      this.street = "",
      this.houseNumer = ""});
}
