part of 'get_weather_information_bloc.dart';

sealed class GetWeatherInformationState extends Equatable {
  const GetWeatherInformationState();
  
  @override
  List<Object> get props => [];
}

final class GetWeatherInformationInitial extends GetWeatherInformationState {}
final class GetWeatherInformationProgress extends GetWeatherInformationState {}
final class GetWeatherInformationSuccess extends GetWeatherInformationState {}
final class GetWeatherInformationFailure extends GetWeatherInformationState {}
