part of 'post_weather_local_bloc.dart';

sealed class PostWeatherLocalEvent {}

class PostWeatherLocalStarted extends PostWeatherLocalEvent {
  final WeatherModel weatherModel;

  PostWeatherLocalStarted(this.weatherModel);
}
