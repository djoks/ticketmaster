import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:ticketmaster/utils/logger.dart';

part 'app_database.g.dart';

/// Returns a [LazyDatabase] that initializes the database connection on first use.
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    if (!await dbFolder.exists()) {
      await dbFolder.create(recursive: true);
    }
    final file = File(p.join(dbFolder.path, 'ticketmaster_db.sqlite'));
    log.d('Drift DB path: ${file.path}');
    return NativeDatabase(file);
  });
}

/// The main application database using Drift.
///
/// Extend this class with your tables as needed.
@DriftDatabase(tables: [])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}
