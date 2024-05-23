import 'package:alert/models/entities/address_entity.dart';
import 'package:alert/services/local_db.dart';
import 'package:isar/isar.dart';

class AddressDb {
  final LocalDb db;
  AddressDb(this.db);

  Future<void> saveAddress(AddressEntity address) async {
    db.instance
        .writeTxnSync<int>(() => db.instance.addressEntitys.putSync(address));
  }

  Future<AddressEntity?> getAddress() async {
    return await db.instance.addressEntitys.where().findFirst();
  }

  Future<void> updateContact(AddressEntity address) async {
    await db.instance.writeTxn(() async {
      await db.instance.addressEntitys.delete(address.id);
      db.instance.addressEntitys.put(address);
    });
  }

  Future<void> deleteContact(AddressEntity address) async {
    await db.instance.writeTxn(() async {
      await db.instance.addressEntitys.delete(address.id);
    });
  }
}
