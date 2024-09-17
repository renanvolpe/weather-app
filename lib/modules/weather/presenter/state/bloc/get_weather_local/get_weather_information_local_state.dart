part of 'get_weather_information_local_bloc.dart';

sealed class GetWeatherLocalState extends Equatable {
  const GetWeatherLocalState();

  @override
  List<Object> get props => [];
}

final class GetWeatherLocalInitial extends GetWeatherLocalState {}

final class GetWeatherLocalProgress extends GetWeatherLocalState {}

final class GetWeatherLocalSuccess extends GetWeatherLocalState {
  final WeatherModel weatherModel;

  const GetWeatherLocalSuccess(this.weatherModel);
}

final class GetWeatherLocalFailure extends GetWeatherLocalState {
  final String message;

  const GetWeatherLocalFailure(this.message);
}
