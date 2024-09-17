part of 'get_weather_information_local_bloc.dart';

sealed class GetWeatherLocalEvent extends Equatable {
  const GetWeatherLocalEvent();

  @override
  List<Object> get props => [];
}

class GetWeatherLocalStarted extends GetWeatherLocalEvent {
  final int id;

  const GetWeatherLocalStarted(this.id);
}
