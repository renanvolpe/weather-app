part of 'network_bloc.dart';

sealed class NetworkEvent extends Equatable {
  const NetworkEvent();

  @override
  List<Object> get props => [];
}

class NetworkDisconnectedStarted extends NetworkEvent {}

class NetworkConnectedStarted extends NetworkEvent {}

class NetworkListenedStarted extends NetworkEvent {}
