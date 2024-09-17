import 'package:bloc/bloc.dart';

import '../../../../domain/usecase/delete_weather_local_usecase.dart';

part 'delete_weather_local_event.dart';
part 'delete_weather_local_state.dart';

class DeleteWeatherLocalBloc extends Bloc<DeleteWeatherLocalEvent, DeleteWeatherLocalState> {
  DeleteWeatherLocalBloc(DeleteWeatherLocalUsecase usecase) : super(DeleteWeatherLocalInitial()) {
    on<DeleteWeatherLocalStarted>((event, emit) async {
      emit(DeleteWeatherLocalProgress());
      var response = await usecase.call(event.id);
      response.fold(
        (failure) => emit(DeleteWeatherLocalFailure(failure.message!)),
        (success) => emit(DeleteWeatherLocalSuccess(success)),
      );
    });
  }
}
