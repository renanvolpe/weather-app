part of 'get_weather_information_bloc.dart';

sealed class GetWeatherInformationEvent extends Equatable {
  const GetWeatherInformationEvent();

  @override
  List<Object> get props => [];
}

class GetWeatherInformation extends GetWeatherInformationEvent {
  final String text;
  const GetWeatherInformation(this.text);
}
