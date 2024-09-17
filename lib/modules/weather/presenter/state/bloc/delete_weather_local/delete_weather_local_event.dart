part of 'delete_weather_local_bloc.dart';

sealed class DeleteWeatherLocalEvent {}

class DeleteWeatherLocalStarted extends DeleteWeatherLocalEvent {
  final int id;

  DeleteWeatherLocalStarted(this.id);
}
