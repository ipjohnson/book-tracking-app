import 'package:drift/drift.dart';
import 'package:book_tracking_app/database/database.dart';

class SettingsRepository {
  final AppDatabase _db;

  SettingsRepository(this._db);

  Future<String?> get(String key) async {
    final row = await (_db.select(_db.settings)
          ..where((t) => t.key.equals(key)))
        .getSingleOrNull();
    return row?.value;
  }

  Future<void> set(String key, String value) async {
    await _db.into(_db.settings).insertOnConflictUpdate(
          SettingsCompanion(
            key: Value(key),
            value: Value(value),
          ),
        );
  }

  Future<void> delete(String key) async {
    await (_db.delete(_db.settings)..where((t) => t.key.equals(key))).go();
  }
}
