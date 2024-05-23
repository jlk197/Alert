import 'package:alert/models/entities/address_entity.dart';
import 'package:alert/models/entities/contact_entity.dart';
import 'package:alert/models/entities/pill_entity.dart';
import 'package:alert/models/entities/pills_taking_entity.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class LocalDb {
  late Isar instance;

  Future initalize() async {
    final dir = await getApplicationDocumentsDirectory();
    instance = await Isar.open(
      [
        ContactEntitySchema,
        PillEntitySchema,
        PillsTakingEntitySchema,
        AddressEntitySchema
      ],
      directory: dir.path,
      inspector: true,
    );
  }
}
