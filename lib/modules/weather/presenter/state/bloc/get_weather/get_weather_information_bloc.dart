// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/modules/weather/data/model/weather_model/weather_model.dart';

import '../../../../domain/usecase/get_weather_usecase.dart';

part 'get_weather_information_event.dart';
part 'get_weather_information_state.dart';

class GetWeatherBloc extends Bloc<GetWeatherEvent, GetWeatherState> {
  GetWeatherUseCase usecase;
  GetWeatherBloc(
    this.usecase,
  ) : super(GetWeatherInitial()) {
    on<GetWeather>((event, emit) async {
      emit(GetWeatherProgress());
      var response = await usecase.call(event.text);
      response.fold((failure) => emit(GetWeatherFailure(failure.message!)),
          (success) => emit(GetWeatherSuccess(success)));
    });
  }
}
