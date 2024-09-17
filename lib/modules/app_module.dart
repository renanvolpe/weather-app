import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/app_service.dart';
import 'package:weather_app/modules/shared/shared_module.dart';

import 'weather/weather_module.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton(AppService.new);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.module('/', module: WeatherModule());
    super.routes(r);
  }

  @override
  List<Module> get imports => [SharedModule()];
}
