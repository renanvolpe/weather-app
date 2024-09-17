import 'package:dartz/dartz.dart';
import 'package:weather_app/modules/shared/dio/dio_service.dart';
import 'package:weather_app/modules/weather/data/abstract_datasource/abstract_weather_datasource.dart';
import 'package:weather_app/modules/weather/data/model/weather_model/weather_model.dart';

import '../../../core/utils/constants/endpoint.dart';
import '../../../core/utils/constants/failure.dart';

class WeatherDatasourceImpl implements IWeatherDatasourceApi {
  DioService dioClient;

  WeatherDatasourceImpl({
    required this.dioClient,
  });

  @override
  Future<Either<Failure, WeatherModel>> getWeatherApi(String text) async {
    Map<String, String>? params = {"q": text};
    var response = await dioClient.dioGet(endpoint: Endpoint.current, params: params);

    return response.fold((failure) {
      return Left(failure);
    }, (success) {
      var weatherModel = WeatherModel.fromMap(success);
      return Right(weatherModel);
    });
  }
  
  @override
  Future<Either<Failure, List<WeatherModel>>> getListWeatherApi() {
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, int>> saveWeatherApi(weather) {
    throw UnimplementedError();
  }
}
