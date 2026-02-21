import 'package:drift/drift.dart';

part 'database.g.dart';

@DataClassName('BookData')
class Books extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get authors => text()();
  TextColumn get isbn10 => text().nullable()();
  TextColumn get isbn13 => text().nullable()();
  TextColumn get thumbnailUrl => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get publisher => text().nullable()();
  IntColumn get pageCount => integer().nullable()();
  TextColumn get publishedDate => text().nullable()();
  TextColumn get status => text().withDefault(const Constant('wantToRead'))();
  DateTimeColumn get dateAdded => dateTime()();
  IntColumn get rating => integer().withDefault(const Constant(0))();
  TextColumn get googleBooksId => text().nullable()();
}

@DataClassName('SettingData')
class Settings extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {key};
}

@DriftDatabase(tables: [Books, Settings])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) => m.createAll(),
        onUpgrade: (m, from, to) async {
          if (from < 2) {
            await m.createTable(settings);
          }
        },
      );
}
