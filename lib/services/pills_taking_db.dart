import 'package:alert/models/entities/pills_taking_entity.dart';
import 'package:alert/services/local_db.dart';
import 'package:isar/isar.dart';

class PillsTakingDb {
  final LocalDb db;
  PillsTakingDb(this.db);

  Future<void> savePill(PillsTakingEntity pill) async {
    var saved = await db.instance.pillsTakingEntitys
        .where()
        .filter()
        .pillIdEqualTo(pill.pillId)
        .hourEqualTo(pill.hour)
        .dateEqualTo(pill.date)
        .findFirst();
    if (saved != null) {
      pill.id = saved.id;
    }
    db.instance
        .writeTxnSync<int>(() => db.instance.pillsTakingEntitys.putSync(pill));
  }

  Future<List<PillsTakingEntity>> getPills() async {
    return await db.instance.pillsTakingEntitys.where().findAll();
  }

  Future<void> deletePill(PillsTakingEntity pill) async {
    await db.instance.writeTxn(() async {
      await db.instance.pillsTakingEntitys.delete(pill.id);
    });
  }
}
