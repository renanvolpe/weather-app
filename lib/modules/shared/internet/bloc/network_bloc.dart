import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

part 'network_event.dart';
part 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  late StreamSubscription _subscription;

  NetworkBloc() : super(NetworkInitial()) {
    on<NetworkEvent>((event, emit) async {
      if (event is NetworkConnectedStarted) {
        emit(NetworkConnected());
      } else if (event is NetworkDisconnectedStarted) {
        emit(NetworkNotConnected());
      }

      _subscription = Connectivity().onConnectivityChanged.listen((listResults) async {
        for (var result in listResults) {
          if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
            add(NetworkConnectedStarted());
          } else {
            add(NetworkDisconnectedStarted());
          }
        }
      });
    });
  }
  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
