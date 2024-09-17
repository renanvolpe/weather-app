import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:weather_app/modules/shared/sqlite/sqlite_config.dart';
import 'package:weather_app/modules/weather/data/abstract_datasource/abstract_weather_datasource.dart';
import 'package:weather_app/modules/weather/data/impl_datasource/weather_datasource_local_impl.dart';
import 'package:weather_app/modules/weather/data/model/weather_model/weather_model.dart';

import '../../../../../mock.dart';

void sqfliteTestInit() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
}

void main() {
  sqfliteTestInit();
  late IWeatherDatasourceLocal datasource;
  setUpAll(() async {
    var config = SqliteConfig();
    await config.initDatabase();

    datasource = WeatherDatasourceLocalImpl(sqliteConfig: config);
  });

  tearDownAll(() {});

  group("Test get weather", () {
    late int idWeather;
    test("Test save weather in local from data from api", () async {
      var newWeather = WeatherModel.fromMap(sjcMock);
      var response = await datasource.saveWeather(newWeather);
      expect(response, isA<Right>());
      response.fold((failure) {}, (success) {
        idWeather = success;
        expect(success, isA<int>());
      });
    });
    test("Test get list weather from local saved", () async {
      var response = await datasource.getListWeather();
      expect(response, isA<Right>());
      response.fold((failure) {}, (success) {
        expect(success, isA<List<WeatherModel>?>());
      });
    });
    test("Test get weather from local", () async {
      var response = await datasource.getWeather(idWeather);
      expect(response, isA<Right>());
      response.fold((failure) {}, (success) {
        expect(success, isA<WeatherModel>());
      });
    });

    test("Test delete weather from local", () async {
      var response = await datasource.deleteWeather(idWeather);
      expect(response, isA<Right>());
      response.fold((failure) {}, (success) {
        expect(success, isA<int>());
      });
    });
  });
}
