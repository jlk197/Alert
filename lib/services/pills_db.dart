import 'package:alert/models/entities/pill_entity.dart';
import 'package:alert/services/local_db.dart';
import 'package:isar/isar.dart';

class PillsDb {
  final LocalDb db;
  PillsDb(this.db);

  Future<void> savePill(PillEntity pill) async {
    //db.instance.writeTxnSync<int>(() => db.instance.pillEntitys.putSync(pill));
    await db.instance.writeTxn(() async {
      await db.instance.pillEntitys.put(pill);
    });
  }

  Future<List<PillEntity>> getPills() async {
    return await db.instance.pillEntitys.where().findAll();
  }

  Future<void> updatePill(PillEntity pill) async {
    await db.instance.writeTxn(() async {
      await db.instance.pillEntitys.delete(pill.id);
      db.instance.pillEntitys.put(pill);
    });
  }

  Future<void> deletePill(PillEntity pill) async {
    await db.instance.writeTxn(() async {
      await db.instance.pillEntitys.delete(pill.id);
    });
  }
}
