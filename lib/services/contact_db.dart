import 'package:alert/models/entities/contact_entity.dart';
import 'package:alert/services/local_db.dart';
import 'package:isar/isar.dart';

class ContactDb {
  final LocalDb db;
  ContactDb(this.db);

  Future<void> saveContact(ContactEntity contact) async {
    var isSaved = await db.instance.contactEntitys
            .where()
            .filter()
            .numberEqualTo(contact.number)
            .findFirst() !=
        null;
    if (!isSaved) {
      db.instance
          .writeTxnSync<int>(() => db.instance.contactEntitys.putSync(contact));
    }
  }

  Future<List<ContactEntity>> getContacts() async {
    return await db.instance.contactEntitys.where().findAll();
  }

  Future<void> updateContact(ContactEntity contact) async {
    await db.instance.writeTxn(() async {
      await db.instance.contactEntitys.delete(contact.id);
      db.instance.contactEntitys.put(contact);
    });
  }

  Future<void> deleteContact(ContactEntity contact) async {
    await db.instance.writeTxn(() async {
      await db.instance.contactEntitys.delete(contact.id);
    });
  }
}
