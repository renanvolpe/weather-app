part of 'get_weather_information_local_bloc.dart';

sealed class GetWeatherInformationLocalState extends Equatable {
  const GetWeatherInformationLocalState();

  @override
  List<Object> get props => [];
}

final class GetWeatherInformationLocalInitial extends GetWeatherInformationLocalState {}

final class GetWeatherInformationLocalProgress extends GetWeatherInformationLocalState {}

final class GetWeatherInformationLocalSuccess extends GetWeatherInformationLocalState {
  final WeatherModel weatherModel;

  const GetWeatherInformationLocalSuccess(this.weatherModel);
}

final class GetWeatherInformationLocalFailure extends GetWeatherInformationLocalState {
  final String message;

  const GetWeatherInformationLocalFailure(this.message);
}
