import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/modules/weather/data/model/forecastday/forecastday_model.dart';
import 'package:weather_app/modules/weather/domain/usecase/get_forecast_7days_usecase.dart';

part 'get_forecast7_days_event.dart';
part 'get_forecast7_days_state.dart';

class GetForecast7DaysBloc extends Bloc<GetForecast7DaysEvent, GetForecast7DaysState> {
  final GetForecast7daysUsecase usecase;
  GetForecast7DaysBloc(this.usecase) : super(GetForecast7DaysInitial()) {
    on<GetForecast7Days>((event, emit) async {
      emit(GetForecast7DaysProgress());
      var response = await usecase.call(event.param);
      response.fold((failure) {
        emit(GetForecast7DaysFailure(failure.message!));
      }, (success) {
        emit(GetForecast7DaysSuccess(success));
      });
    });
  }
}
