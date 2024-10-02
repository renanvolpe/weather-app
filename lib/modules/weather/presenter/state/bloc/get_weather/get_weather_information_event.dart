part of 'get_weather_information_bloc.dart';

sealed class GetWeatherEvent extends Equatable {
  const GetWeatherEvent();

  @override
  List<Object> get props => [];
}

class GetWeather extends GetWeatherEvent {
  final GetWeatherParams param;
  const GetWeather(this.param);
}
