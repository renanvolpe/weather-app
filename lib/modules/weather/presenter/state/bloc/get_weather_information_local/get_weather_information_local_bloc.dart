// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:weather_app/modules/weather/data/model/weather_model/weather_model.dart';
import 'package:weather_app/modules/weather/domain/usecase/get_weather_information_local_usecase.dart';

part 'get_weather_information_local_event.dart';
part 'get_weather_information_local_state.dart';

class GetWeatherInformationLocalBloc extends Bloc<GetWeatherInformationLocalEvent, GetWeatherInformationLocalState> {
  GetWeatherInformationLocalUseCase usecase;
  GetWeatherInformationLocalBloc(
    this.usecase,
  ) : super(GetWeatherInformationLocalInitial()) {
    on<GetWeatherInformationLocalStarted>((event, emit) async {
      emit(GetWeatherInformationLocalProgress());
      var response = await usecase.call(event.id);

      response.fold((failure) => emit(GetWeatherInformationLocalFailure(failure.message!)),
          (success) => emit(GetWeatherInformationLocalSuccess(success)));
    });
  }
}
