part of 'delete_weather_local_bloc.dart';

sealed class DeleteWeatherLocalState {}

final class DeleteWeatherLocalInitial extends DeleteWeatherLocalState {}
final class DeleteWeatherLocalProgress extends DeleteWeatherLocalState {}
final class DeleteWeatherLocalSuccess extends DeleteWeatherLocalState {
  final int id;
  DeleteWeatherLocalSuccess(this.id);
}
final class DeleteWeatherLocalFailure extends DeleteWeatherLocalState {
  final String message;
  DeleteWeatherLocalFailure(this.message);
}
