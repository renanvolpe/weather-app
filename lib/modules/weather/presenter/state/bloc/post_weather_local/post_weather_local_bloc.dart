import 'package:bloc/bloc.dart';

import '../../../../data/model/weather_model/weather_model.dart';
import '../../../../domain/usecase/post_weather_local_usecase.dart';

part 'post_weather_local_event.dart';
part 'post_weather_local_state.dart';

class PostWeatherLocalBloc extends Bloc<PostWeatherLocalEvent, PostWeatherLocalState> {
  PostWeatherLocalBloc(PostWeatherLocalUseCase usecase) : super(PostWeatherLocalInitial()) {
    on<PostWeatherLocalStarted>((event, emit) async {
      emit(PostWeatherLocalProgress());
      var response = await usecase.call(event.weatherModel);
      response.fold((failure) => emit(PostWeatherLocalFailure(failure.message!)),
          (success) => emit(PostWeatherLocalSuccess(success)));
    });
  }
}
