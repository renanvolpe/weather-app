part of 'get_forecast7_days_bloc.dart';

sealed class GetForecast7DaysState extends Equatable {
  const GetForecast7DaysState();

  @override
  List<Object> get props => [];
}

final class GetForecast7DaysInitial extends GetForecast7DaysState {}

final class GetForecast7DaysProgress extends GetForecast7DaysState {}

final class GetForecast7DaysSuccess extends GetForecast7DaysState {
  final List<ForecastdayModel> list;

  const GetForecast7DaysSuccess(this.list);
}

final class GetForecast7DaysFailure extends GetForecast7DaysState {
  final String message;

  const GetForecast7DaysFailure(this.message);
}
