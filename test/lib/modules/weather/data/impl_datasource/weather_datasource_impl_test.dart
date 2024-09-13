import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/modules/shared/dio/dio_service.dart';
import 'package:weather_app/modules/weather/data/abstract_datasource/abstract_weather_datasource.dart';
import 'package:weather_app/modules/weather/data/impl_datasource/weather_datasource_impl.dart';
import 'package:weather_app/modules/weather/data/model/weather_model/weather_model.dart';

void main() {
  late IWeatherDatasource datasource;
  setUpAll(() async{
    await dotenv.load(fileName: '.env');
    datasource = WeatherDatasourceImpl( dioClient:DioClient(Dio()));
  });
  group("Test get weather", () {
    test("Test get weather from api", () async {
      var response = await datasource.getWeatherApi("Sao jose dos campos");
      expect(response, isA<Right>());
      response.fold((failure) {}, (success) {
        expect(success, isA<WeatherModel>());
      });
    });
  });
}
