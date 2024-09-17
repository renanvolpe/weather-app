part of 'get_list_weather_information_local_bloc.dart';

sealed class GetListWeatherInformationLocalState {}

final class GetListWeatherInformationLocalInitial extends GetListWeatherInformationLocalState {}

final class GetListWeatherInformationLocalProgress extends GetListWeatherInformationLocalState {}

final class GetListWeatherInformationLocalSuccess extends GetListWeatherInformationLocalState {
  final List<WeatherModel> listWeather;
  GetListWeatherInformationLocalSuccess(this.listWeather);
}

final class GetListWeatherInformationLocalFailure extends GetListWeatherInformationLocalState {
  final String message;
  GetListWeatherInformationLocalFailure(this.message);
}
