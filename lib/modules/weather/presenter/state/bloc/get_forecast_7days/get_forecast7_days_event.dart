part of 'get_forecast7_days_bloc.dart';

sealed class GetForecast7DaysEvent extends Equatable {
  const GetForecast7DaysEvent();

  @override
  List<Object> get props => [];
}

class GetForecast7Days extends GetForecast7DaysEvent {
  final ForecastParam param;

  const GetForecast7Days(this.param);
}
