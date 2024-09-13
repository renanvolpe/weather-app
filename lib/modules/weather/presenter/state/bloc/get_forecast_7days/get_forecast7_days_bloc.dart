import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_forecast7_days_event.dart';
part 'get_forecast7_days_state.dart';

class GetForecast7DaysBloc extends Bloc<GetForecast7DaysEvent, GetForecast7DaysState> {
  GetForecast7DaysBloc() : super(GetForecast7DaysInitial()) {
    on<GetForecast7DaysEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
