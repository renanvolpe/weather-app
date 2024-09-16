import 'package:dartz/dartz.dart';
import 'package:weather_app/modules/weather/data/model/weather_model/weather_model.dart';

import '../../../core/utils/constants/failure.dart';

abstract class IWeatherDatasource {
  Future<Either<Failure, WeatherModel>> getWeatherApi(String text);
  Future<Either<Failure, List<WeatherModel>>> getListWeatherApi();
  Future<Either<Failure, int>> saveWeatherApi(WeatherModel model);
}
