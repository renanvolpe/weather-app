part of 'get_weather_information_bloc.dart';

sealed class GetWeatherState extends Equatable {
  const GetWeatherState();

  @override
  List<Object> get props => [];
}

final class GetWeatherInitial extends GetWeatherState {}

final class GetWeatherProgress extends GetWeatherState {}

final class GetWeatherSuccess extends GetWeatherState {
  final WeatherModel weatherModel;

  const GetWeatherSuccess(this.weatherModel);
}

final class GetWeatherFailure extends GetWeatherState {
  final String message;

  const GetWeatherFailure(this.message);
}
