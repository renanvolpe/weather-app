part of 'get_forecast7_days_bloc.dart';

sealed class GetForecast7DaysState extends Equatable {
  const GetForecast7DaysState();
  
  @override
  List<Object> get props => [];
}

final class GetForecast7DaysInitial extends GetForecast7DaysState {}
