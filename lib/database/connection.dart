import 'package:book_tracking_app/database/database.dart';
import 'package:drift_flutter/drift_flutter.dart';

AppDatabase constructDb() {
  final db = AppDatabase(driftDatabase(
    name: 'book_tracking',
    web: DriftWebOptions(
      sqlite3Wasm: Uri.parse('sqlite3.wasm'),
      driftWorker: Uri.parse('drift_worker.js'),
    ),
  ));
  return db;
}
