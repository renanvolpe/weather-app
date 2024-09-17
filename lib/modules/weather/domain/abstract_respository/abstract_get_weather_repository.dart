import 'package:dartz/dartz.dart';

import '../../../core/utils/constants/failure.dart';
import '../../data/model/weather_model/weather_model.dart';

abstract class IGetWeatherRepository {
  Future<Either<Failure, WeatherModel>> getWeather(String text);
  Future<Either<Failure, WeatherModel>> getWeatherLocal(int id);
  Future<Either<Failure, List<WeatherModel>>> getListWeatherLocal();
}
