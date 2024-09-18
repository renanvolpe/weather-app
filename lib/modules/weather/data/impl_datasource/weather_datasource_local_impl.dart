// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:weather_app/modules/core/utils/failure.dart';
import 'package:weather_app/modules/weather/data/model/condition_model.dart';
import 'package:weather_app/modules/weather/data/model/weather_model/current_model.dart';

import '../../../shared/sqlite/fields.dart';
import '../../../shared/sqlite/sqlite_config.dart';
import '../../../shared/sqlite/tables.dart';
import '../abstract_datasource/abstract_weather_datasource.dart';
import '../model/weather_model/location_model.dart';
import '../model/weather_model/weather_model.dart';

class WeatherDatasourceLocalImpl implements IWeatherDatasourceLocal {
  SqliteConfig sqliteConfig;

  WeatherDatasourceLocalImpl(this.sqliteConfig);

  @override
  Future<Either<Failure, WeatherModel>> getWeather(int idWeather) async {
    try {
      var response = await sqliteConfig.database.query(Tables.weatherTable, where: 'id = ?', whereArgs: [idWeather]);

      int currentId = response.first["current_id"] as int;
      int locationId = response.first["location_id"] as int;

      var currentResponse =
          await sqliteConfig.database.query(Tables.currentTable, where: 'id = ?', whereArgs: [currentId]);

      int conditionId = currentResponse.first["condition_id"] as int;

      var conditionResponse =
          await sqliteConfig.database.query(Tables.conditionTable, where: 'id = ?', whereArgs: [conditionId]);

      var newCondition = ConditionModel.fromMap(conditionResponse.first);

      var condition = {
        "condition": {...newCondition.toMap()}
      };

      var updatedCurrent = {...currentResponse.first, ...condition};

      var newCurrent = CurrentModel.fromMap(updatedCurrent);

      var locationResponse =
          await sqliteConfig.database.query(Tables.locationTable, where: 'id = ?', whereArgs: [locationId]);

      var newLocation = LocationModel.fromMap(locationResponse.first);

      var weather = WeatherModel(id: idWeather, current: newCurrent, location: newLocation);

      return Right(weather);
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<WeatherModel>>> getListWeather() async {
    try {
      var response = await sqliteConfig.database.query(Tables.weatherTable);

      List<WeatherModel> newList = [];
      for (var e in response) {
        int currentId = e["current_id"] as int;
        int locationId = e["location_id"] as int;
        int weatherId = e["id"] as int;

        var currentResponse =
            await sqliteConfig.database.query(Tables.currentTable, where: 'id = ?', whereArgs: [currentId]);

        int conditionId = currentResponse.first["condition_id"] as int;

        var conditionResponse =
            await sqliteConfig.database.query(Tables.conditionTable, where: 'id = ?', whereArgs: [conditionId]);

        var newCondition = ConditionModel.fromMap(conditionResponse.first);

        var condition = {
          "condition": {...newCondition.toMap()}
        };

        var updatedCurrent = {...currentResponse.first, ...condition};

        var newCurrent = CurrentModel.fromMap(updatedCurrent);

        var locationResponse =
            await sqliteConfig.database.query(Tables.locationTable, where: 'id = ?', whereArgs: [locationId]);

        var newLocation = LocationModel.fromMap(locationResponse.first);

        var weather = WeatherModel(id: weatherId, current: newCurrent, location: newLocation);

        newList.add(weather);
      }
      return Right(newList);
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> saveWeather(WeatherModel model) async {
    try {
      Map data = model.toMap();
      final locationData = data['location'];
      final currentData = data['current'];
      final conditionData = currentData['condition'];

      // Insert into Location table
      final locationId = await sqliteConfig.database.insert(Tables.locationTable, locationData.cast<String, dynamic>(),
          conflictAlgorithm: ConflictAlgorithm.replace);

      var idCondition = await sqliteConfig.database.insert(Tables.conditionTable, conditionData.cast<String, dynamic>(),
          conflictAlgorithm: ConflictAlgorithm.replace);

      currentData.remove('condition');
      currentData['condition_id'] = idCondition;

      // Insert into Current table
      final currentId = await sqliteConfig.database.insert(Tables.currentTable, currentData.cast<String, dynamic>(),
          conflictAlgorithm: ConflictAlgorithm.replace);

      await sqliteConfig.database.insert(Tables.conditionTable, conditionData.cast<String, dynamic>(),
          conflictAlgorithm: ConflictAlgorithm.replace);

      int idWeather = await sqliteConfig.database.insert(
          Tables.weatherTable,
          {
            WeatherFields.location_id: locationId,
            WeatherFields.current_id: currentId,
          },
          conflictAlgorithm: ConflictAlgorithm.replace);
      return Right(idWeather);
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> deleteWeather(int idWeather) async {
    try {
      var responseWeather =
          await sqliteConfig.database.query(Tables.weatherTable, where: 'id = ?', whereArgs: [idWeather]);

      int currentId = responseWeather.first["current_id"] as int;
      int locationId = responseWeather.first["location_id"] as int;

      var responseCurrent =
          await sqliteConfig.database.query(Tables.currentTable, where: 'id = ?', whereArgs: [currentId]);

      int conditionId = responseCurrent.first["condition_id"] as int;

      int id = await sqliteConfig.database.delete(Tables.weatherTable, where: "id = ?", whereArgs: [idWeather]);
      await sqliteConfig.database.delete(Tables.locationTable, where: "id = ?", whereArgs: [locationId]);
      await sqliteConfig.database.delete(Tables.currentTable, where: "id = ?", whereArgs: [currentId]);
      await sqliteConfig.database.delete(Tables.conditionTable, where: "id = ?", whereArgs: [conditionId]);
      return Right(id);
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }
}
