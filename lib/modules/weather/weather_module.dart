import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../shared/dio/dio_service.dart';
import 'data/abstract_datasource/abstract_weather_datasource.dart';
import 'data/impl_datasource/weather_datasource_impl.dart';
import 'data/impl_repository/get_weather_repository_impl.dart';
import 'domain/abstract_respository/abstract_get_weather_repository.dart';
import 'domain/usecase/get_weather_information.dart';
import 'presenter/screen/forecast_page.dart';
import 'presenter/screen/weather_page.dart';
import 'presenter/screen/welcome_page.dart';
import 'presenter/state/bloc/get_weather_information_bloc.dart';

class WeatherModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const WelcomePage());
    r.child('/weather', child: (_) => const WeatherPage());
    r.child('/forecast', child: (_) => const ForecastPage());
    super.routes(r);
  }

  @override
  void binds(Injector i) {
    i.add(() => Dio());
    i.addSingleton<DioService>(DioClient.new);
    i.addSingleton<IWeatherDatasource>(WeatherDatasourceImpl.new);
    i.addSingleton<IGetWeatherRepository>(GetWeatherRepositoryImpl.new);
    i.addSingleton(GetWeatherInformationUseCase.new);
    i.addSingleton(GetWeatherInformationBloc.new);
    super.binds(i);
  }

  // @override
  // List<Module> get imports => [SharedModule()];
}
