import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/modules/app_module.dart';
import 'package:weather_app/modules/weather/data/abstract_datasource/abstract_forecast_datasource.dart';
import 'package:weather_app/modules/weather/domain/usecase/delete_weather_local_usecase.dart';
import 'package:weather_app/modules/weather/domain/usecase/get_forecast_7days_usecase.dart';
import 'package:weather_app/modules/weather/presenter/state/bloc/post_weather_local/post_weather_local_bloc.dart';

import 'data/abstract_datasource/abstract_weather_datasource.dart';
import 'data/impl_datasource/forecast_datasource_impl.dart';
import 'data/impl_datasource/weather_datasource_impl.dart';
import 'data/impl_datasource/weather_datasource_local_impl.dart';
import 'data/impl_repository/get_forecast_repository_impl.dart';
import 'data/impl_repository/get_weather_repository_impl.dart';
import 'domain/abstract_respository/abstract_get_forecast_repository.dart';
import 'domain/abstract_respository/abstract_get_weather_repository.dart';
import 'domain/usecase/get_list_weather_local_usecase.dart';
import 'domain/usecase/get_weather_local_usecase.dart';
import 'domain/usecase/get_weather_usecase.dart';
import 'domain/usecase/post_weather_local_usecase.dart';
import 'presenter/screen/forecast_page.dart';
import 'presenter/screen/weather_page.dart';
import 'presenter/screen/welcome_page.dart';
import 'presenter/state/bloc/delete_weather_local/delete_weather_local_bloc.dart';
import 'presenter/state/bloc/get_forecast_7days/get_forecast7_days_bloc.dart';
import 'presenter/state/bloc/get_list_weather_local/get_list_weather_information_local_bloc.dart';
import 'presenter/state/bloc/get_weather/get_weather_information_bloc.dart';
import 'presenter/state/bloc/get_weather_local/get_weather_information_local_bloc.dart';

class WeatherModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const WelcomePage());
    r.child('/weather', child: (_) => const WeatherPage());
    r.child('/forecast', child: (_) => ForecastPage(text: r.args.data as String));
    super.routes(r);
  }

  @override
  void binds(Injector i) {
    // //Weather
    i.addSingleton<IWeatherRepository>(GetWeatherRepositoryImpl.new);

    //Weather - Api
    i.addSingleton<IWeatherDatasourceApi>(WeatherDatasourceImpl.new);
    i.addSingleton(GetWeatherUseCase.new);
    i.addSingleton(GetWeatherBloc.new);

    //Weather - Local
    i.addSingleton<IWeatherDatasourceLocal>(WeatherDatasourceLocalImpl.new);

    i.addSingleton(GetWeatherLocalUseCase.new);
    i.addSingleton(GetWeatherLocalBloc.new);

    i.addSingleton(PostWeatherLocalUseCase.new);
    i.addSingleton(PostWeatherLocalBloc.new);

    i.addSingleton(GetListWeatherLocalUseCase.new);
    i.addSingleton(GetListWeatherLocalBloc.new);

    i.addSingleton(DeleteWeatherLocalBloc.new);
    i.addSingleton(DeleteWeatherLocalUsecase.new);

    //Forecast - Api
    i.addSingleton<IForecastDatasource>(ForecastDatasourceImpl.new);
    i.addSingleton<IGetForecastRepository>(GetForecastRepositoryImpl.new);
    i.addSingleton(GetForecast7daysUsecase.new);
    i.addSingleton(GetForecast7DaysBloc.new);

    super.binds(i);
  }

  @override
  List<Module> get imports => [AppModule()];
}
