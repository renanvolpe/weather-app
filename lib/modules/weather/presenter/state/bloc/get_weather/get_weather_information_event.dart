part of 'get_weather_information_bloc.dart';

sealed class GetWeatherEvent extends Equatable {
  const GetWeatherEvent();

  @override
  List<Object> get props => [];
}

class GetWeather extends GetWeatherEvent {
  final String text;
  final int? id;
  const GetWeather({required this.text, this.id});
}
