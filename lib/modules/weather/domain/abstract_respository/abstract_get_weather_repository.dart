import 'package:dartz/dartz.dart';

import '../../../core/utils/constants/failure.dart';
import '../../data/model/weather_model/weather_model.dart';

abstract class IGetWeatherRepository {
  Future<Either<Failure, WeatherModel>> getWeatherInformation(String text);
  Future<Either<Failure, WeatherModel>> getWeatherInformationLocal(int id);
  Future<Either<Failure, List<WeatherModel>>> getListWeatherInformationLocal(int id);
}
