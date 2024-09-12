import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/screen/forecast_page.dart';
import 'presenter/screen/weather_page.dart';
import 'presenter/screen/welcome_page.dart';

class WeatherModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const WelcomePage());
    r.child('/weather', child: (_) => const WeatherPage());
    r.child('/forecast', child: (_) => const ForecastPage());
    super.routes(r);
  }
}
