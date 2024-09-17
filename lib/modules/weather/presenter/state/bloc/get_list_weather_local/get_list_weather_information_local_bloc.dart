import 'package:bloc/bloc.dart';
import 'package:weather_app/modules/core/utils/constants/abstract_usecase.dart';

import '../../../../data/model/weather_model/weather_model.dart';
import '../../../../domain/usecase/get_list_weather_local_usecase.dart';

part 'get_list_weather_information_local_event.dart';
part 'get_list_weather_information_local_state.dart';

class GetListWeatherLocalBloc
    extends Bloc<GetListWeatherLocalEvent, GetListWeatherLocalState> {
  GetListWeatherLocalBloc(GetListWeatherLocalUseCase usecase)
      : super(GetListWeatherLocalInitial()) {
    on<GetListWeatherLocalStarted>((event, emit) async {
      emit(GetListWeatherLocalProgress());
      var response = await usecase.call(NoParam());
      response.fold((failure) => emit(GetListWeatherLocalFailure(failure.message!)),
          (success) => emit(GetListWeatherLocalSuccess(success)));
    });
  }
}
