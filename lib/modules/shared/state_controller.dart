import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/app_service.dart';
enum StateManagement { bloc, riverpod, getx, mobx }


class StateController {
  static stateFunction({
    required nameFunction,
    Function()? blocFunction,
    Function()? riverpodFunction,
    Function()? getXFunction,
    Function()? mobXFunction,
  }) {
    var state = Modular.get<AppService>().state;
    try {
      return switch (state) {
        StateManagement.bloc => blocFunction!(),
        StateManagement.riverpod => riverpodFunction!(),
        StateManagement.getx => getXFunction!(),
        StateManagement.mobx => mobXFunction!(),
      };
    } catch (e) {
      print("FUNCTIONS WAS NOT MADE FOR TO STATE $state, SEE ABOUT $nameFunction");
      return;
    }
  }

  static StateManagement checkState(String state) {
    return switch (state.toLowerCase()) {
      'bloc' => StateManagement.bloc,
      'riverpod' => StateManagement.riverpod,
      'getx' => StateManagement.getx,
      'mobx' => StateManagement.mobx,
      _ => StateManagement.bloc,
    };
  }
}
