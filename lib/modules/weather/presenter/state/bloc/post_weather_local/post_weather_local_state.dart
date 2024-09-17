part of 'post_weather_local_bloc.dart';

sealed class PostWeatherLocalState {}

final class PostWeatherLocalInitial extends PostWeatherLocalState {}
final class PostWeatherLocalProgress extends PostWeatherLocalState {}
final class PostWeatherLocalSuccess extends PostWeatherLocalState {
  final int id;
  PostWeatherLocalSuccess(this.id);
}
final class PostWeatherLocalFailure extends PostWeatherLocalState {
  final String message;
  PostWeatherLocalFailure(this.message);
}
