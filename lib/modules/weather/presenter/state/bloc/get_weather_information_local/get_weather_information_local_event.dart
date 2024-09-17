part of 'get_weather_information_local_bloc.dart';

sealed class GetWeatherInformationLocalEvent extends Equatable {
  const GetWeatherInformationLocalEvent();

  @override
  List<Object> get props => [];
}

class GetWeatherInformationLocalStarted extends GetWeatherInformationLocalEvent {
  final int id;

  const GetWeatherInformationLocalStarted(this.id);
}
