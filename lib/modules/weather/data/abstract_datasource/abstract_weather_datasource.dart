import 'package:dartz/dartz.dart';
import 'package:weather_app/modules/weather/data/model/weather_model/weather_model.dart';

import '../../../core/utils/constants/failure.dart';

abstract class IWeatherDatasourceApi {
  Future<Either<Failure, WeatherModel>> getWeatherApi(String text);
  Future<Either<Failure, List<WeatherModel>>> getListWeatherApi();
  Future<Either<Failure, int>> saveWeatherApi(WeatherModel model);
}

abstract class IWeatherDatasourceLocal {
  Future<Either<Failure, WeatherModel>> getWeather(int id);
  Future<Either<Failure, List<WeatherModel>>> getListWeather();
  Future<Either<Failure, int>> saveWeather(WeatherModel model);
  Future<Either<Failure, int>> deleteWeather(int id);
}
