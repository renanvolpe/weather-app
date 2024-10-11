// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:weather_app/modules/weather/data/model/weather_model/weather_model.dart';

import '../../../../../core/utils/failure.dart';

abstract class GetWeatherStateR {
  const GetWeatherStateR();

  factory GetWeatherStateR.initial() = Initial;
  factory GetWeatherStateR.loading() = Loading;
  factory GetWeatherStateR.error(Failure exception) = ErrorState;
  factory GetWeatherStateR.success(WeatherModel weather) = SuccessState;
}

class Initial extends GetWeatherStateR {}

class Loading extends GetWeatherStateR {}

class ErrorState extends GetWeatherStateR {
  final Failure exception;

  const ErrorState(this.exception);
}

class SuccessState extends GetWeatherStateR {
  final WeatherModel weather;

  SuccessState(this.weather);
}
