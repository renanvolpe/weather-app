part of 'get_list_weather_information_local_bloc.dart';

sealed class GetListWeatherLocalState {}

final class GetListWeatherLocalInitial extends GetListWeatherLocalState {}

final class GetListWeatherLocalProgress extends GetListWeatherLocalState {}

final class GetListWeatherLocalSuccess extends GetListWeatherLocalState {
  final List<WeatherModel> listWeather;
  GetListWeatherLocalSuccess(this.listWeather);
}

final class GetListWeatherLocalFailure extends GetListWeatherLocalState {
  final String message;
  GetListWeatherLocalFailure(this.message);
}
