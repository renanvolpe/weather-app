import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/modules/core/utils/failure.dart';
import 'package:weather_app/modules/weather/domain/usecase/get_weather_usecase.dart';
import 'package:weather_app/modules/weather/presenter/state/riverpod/get_weather/get_weather_state.dart';

import '../../../../domain/params/get_weather_params.dart';

class GetWeatherController extends StateNotifier<GetWeatherStateR> {
  late GetWeatherUseCase useCase;

  GetWeatherController({required this.useCase}) : super(GetWeatherStateR.initial());

  getlistWeather(GetWeatherParams params) async {
    state = GetWeatherStateR.loading();
    var response = await useCase.call(params);
    state = response.fold(
      (failure) => GetWeatherStateR.error(const UnexpectedFailure()),
      (success) => GetWeatherStateR.success(success),
    );
  }
}
