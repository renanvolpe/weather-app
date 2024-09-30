import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:weather_app/modules/shared/sqlite/fields.dart';
import 'package:weather_app/modules/shared/sqlite/tables.dart';

import 'type_fields.dart';

class SqliteConfig {
  static Database? _database;

  Database get database => _database!;

  Future<void> initDatabase([bool? isToRecreate]) async {
    try {
      final databasePath = await getDatabasesPath();
      final path = '$databasePath/classroom.db';

      var openedDatabase = await openDatabase(
        path,
        version: 1,
        onCreate: (db, v) async => await _createDatabase(db, 1),
      );

      _database = openedDatabase;
      if (isToRecreate == true) {
        await _recreateDB(_database!);
        await initDatabase();
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Error();
    }
  }

  Future<void> _recreateDB(Database database) async {
    await _dropTables(database);
    await _createDatabase(database, 1);
  }

  Future<void> _dropTables(Database database) async {
    try {
      await database.execute('DROP TABLE IF EXISTS ${Tables.weatherTable}');
      await database.execute('DROP TABLE IF EXISTS ${Tables.locationTable}');
      await database.execute('DROP TABLE IF EXISTS ${Tables.conditionTable}');
      await database.execute('DROP TABLE IF EXISTS ${Tables.currentTable}');
    } catch (e) {
      print('Error dropping table: $e');
    }
  }

  Future<void> _createDatabase(Database db, int version) async {
    String queryCreateTable = '''

         CREATE TABLE IF NOT EXISTS ${Tables.weatherTable} (
          ${WeatherFields.id} ${TypeFields.idPrymary},
          ${WeatherFields.current_id} ${TypeFields.id},
          ${WeatherFields.location_id} ${TypeFields.id}
        );
        ''';
    await db.execute(queryCreateTable);

    queryCreateTable = '''
        
          CREATE TABLE IF NOT EXISTS ${Tables.locationTable} (
          ${LocationFields.id} ${TypeFields.idPrymary},
          ${LocationFields.name} ${TypeFields.varchar},
          ${LocationFields.region} ${TypeFields.id},
          ${LocationFields.country} ${TypeFields.varchar},
          ${LocationFields.lat} ${TypeFields.id},
          ${LocationFields.lon} ${TypeFields.id},
          ${LocationFields.tz_id} ${TypeFields.id},
          ${LocationFields.localtime_epoch} ${TypeFields.id},
          ${LocationFields.localtime} ${TypeFields.id}
        );
        ''';

    await db.execute(queryCreateTable);

    queryCreateTable = '''

          CREATE TABLE IF NOT EXISTS ${Tables.currentTable} (
          ${CurrentFields.id} ${TypeFields.idPrymary},
          ${CurrentFields.condition_id} ${TypeFields.id},
          ${CurrentFields.temp_c} ${TypeFields.float},
          ${CurrentFields.temp_f} ${TypeFields.float},
          ${CurrentFields.wind_kph} ${TypeFields.float},
          ${CurrentFields.humidity} ${TypeFields.int},
          ${CurrentFields.feelslike_c} ${TypeFields.float},
          ${CurrentFields.precip_mm} ${TypeFields.float},
          ${CurrentFields.windchill_c} ${TypeFields.float},
          ${CurrentFields.dewpoint_c} ${TypeFields.float},
          ${CurrentFields.vis_km} ${TypeFields.float}
        );

        ''';
        

    await db.execute(queryCreateTable);

    queryCreateTable = '''

        CREATE TABLE IF NOT EXISTS ${Tables.conditionTable} (
          ${ConditionFields.id} ${TypeFields.idPrymary},
          ${ConditionFields.text} ${TypeFields.varchar},
          ${ConditionFields.icon} ${TypeFields.varchar}
        );
        ''';

    await db.execute(queryCreateTable);
    return;
  }
}
