import 'package:bloc/bloc.dart';
import 'package:weather_app/modules/core/utils/constants/abstract_usecase.dart';

import '../../../../data/model/weather_model/weather_model.dart';
import '../../../../domain/usecase/get_list_weather_information_local_usecase.dart';

part 'get_list_weather_information_local_event.dart';
part 'get_list_weather_information_local_state.dart';

class GetListWeatherInformationLocalBloc
    extends Bloc<GetListWeatherInformationLocalEvent, GetListWeatherInformationLocalState> {
  GetListWeatherInformationLocalBloc(GetListWeatherInformationUseCase usecase)
      : super(GetListWeatherInformationLocalInitial()) {
    on<GetListWeatherInformationLocalStarted>((event, emit) async {
      emit(GetListWeatherInformationLocalProgress());
      var response = await usecase.call(NoParam());
      response.fold((failure) => emit(GetListWeatherInformationLocalFailure(failure.message!)),
          (success) => emit(GetListWeatherInformationLocalSuccess(success)));
    });
  }
}
