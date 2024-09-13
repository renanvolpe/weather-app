import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/modules/shared/dio/dio_service.dart';
import 'package:weather_app/modules/weather/data/abstract_datasource/abstract_forecast_datasource.dart';
import 'package:weather_app/modules/weather/data/impl_datasource/forecast_datasource_impl.dart';
import 'package:weather_app/modules/weather/data/model/forecastday/forecastday_model.dart';
import 'package:weather_app/modules/weather/domain/usecase/get_forecast_7days_usecase.dart';

void main() {
  late IForecastDatasource datasource;
  setUpAll(() async {
    await dotenv.load(fileName: '.env');
    datasource = ForecastDatasourceImpl(dioClient: DioClient(Dio()));
  });
  group("Test get weather", () {
    test("Test get weather from api", () async {
      var param = ForecastParam(days: 7, text: "Sao jose dos campos");
      var response = await datasource.getForecastApi(param);
      expect(response, isA<Right>());
      response.fold((failure) {}, (success) {
        expect(success, isA<List<ForecastdayModel>>());
      });
    });
  });
}
