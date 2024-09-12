import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/modules/shared/dio/dio_service.dart';

class SharedModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addSingleton(DioClient.new);
    super.exportedBinds(i);
  }
}
