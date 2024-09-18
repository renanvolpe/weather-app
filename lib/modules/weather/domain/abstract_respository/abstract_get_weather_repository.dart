import 'package:dartz/dartz.dart';

import '../../../core/utils/failure.dart';
import '../../data/model/weather_model/weather_model.dart';

abstract class IWeatherRepository {
  Future<Either<Failure, WeatherModel>> getWeather(String text);
  Future<Either<Failure, WeatherModel>> getWeatherLocal(int id);
  Future<Either<Failure, List<WeatherModel>>> getListWeatherLocal();
  Future<Either<Failure, int>> postWeatherLocal(WeatherModel weather);
  Future<Either<Failure, int>> deletetWeatherLocal(int id);
}
