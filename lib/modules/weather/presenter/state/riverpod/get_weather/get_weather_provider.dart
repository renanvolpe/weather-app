import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/usecase/get_weather_usecase.dart';
import 'get_weather_controller.dart';
import 'get_weather_state.dart';

final getWeatherProvider = StateNotifierProvider<GetWeatherController, GetWeatherStateR>(
    (ref) => GetWeatherController(useCase: Modular.get<GetWeatherUseCase>()));