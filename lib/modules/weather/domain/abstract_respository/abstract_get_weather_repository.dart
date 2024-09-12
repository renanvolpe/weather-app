import 'package:dartz/dartz.dart';

import '../../../core/utils/constants/failure.dart';
import '../../data/model/weather_model/weather_model.dart';

abstract class IGetWeatherRepository {
  Future<Either<Failure, WeatherModel>> getWeatherInformation(String text);
}
