import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/modules/offline_weather/presenter/screen/off_line_weather_page.dart';

class OfflineWeatherModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const OffLineWeatherPage());
    super.routes(r);
  }
}
