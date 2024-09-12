import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/modules/weather/presenter/screen/welcome_page.dart';

class WeatherModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const WelcomePage());
    super.routes(r);
  }
}
