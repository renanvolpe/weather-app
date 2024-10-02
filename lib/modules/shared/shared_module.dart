import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/modules/shared/dio/dio_service.dart';

import 'internet/bloc/network_bloc.dart';
import 'sqlite/sqlite_config.dart';

class SharedModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.add(() => Dio());
    i.addSingleton<DioService>(DioClient.new);

    i.addSingleton(SqliteConfig.new);
    i.addSingleton(() async => await Modular.get<SqliteConfig>().initDatabase());

    i.addSingleton(NetworkBloc.new);
    // i.addSingleton(() => Modular.get<NetworkBloc>()..add(NetworkdListenedStarted()));

    super.exportedBinds(i);
  }
}
