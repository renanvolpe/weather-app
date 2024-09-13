// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/modules/weather/data/model/weather_model/weather_model.dart';

import '../../../../domain/usecase/get_weather_information_usecase.dart';

part 'get_weather_information_event.dart';
part 'get_weather_information_state.dart';

class GetWeatherInformationBloc extends Bloc<GetWeatherInformationEvent, GetWeatherInformationState> {
  GetWeatherInformationUseCase usecase;
  GetWeatherInformationBloc(
    this.usecase,
  ) : super(GetWeatherInformationInitial()) {
    on<GetWeatherInformation>((event, emit) async {
      emit(GetWeatherInformationProgress());
      var response = await usecase.call(event.text);
      response.fold((failure) => emit(GetWeatherInformationFailure(failure.message!)),
          (success) => emit(GetWeatherInformationSuccess(success)));
    });
  }
}
