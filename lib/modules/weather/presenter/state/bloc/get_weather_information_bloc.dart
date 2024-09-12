import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_weather_information_event.dart';
part 'get_weather_information_state.dart';

class GetWeatherInformationBloc extends Bloc<GetWeatherInformationEvent, GetWeatherInformationState> {
  GetWeatherInformationBloc() : super(GetWeatherInformationInitial()) {
    on<GetWeatherInformation>((event, emit) {
      emit(GetWeatherInformationProgress());
      
    });
  }
}
