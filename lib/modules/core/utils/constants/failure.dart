import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([List<Object> props = const []]);

  String? get message => "Error happened";
}

class ServerFailure extends Failure {
  @override
  final String message = "Server in Error, wait for a moment";

  const ServerFailure([String? message]);

  @override
  List<Object> get props => [message];
}

class NetworkFailure extends Failure {
  @override
  final String message;

  const NetworkFailure(this.message);

  @override
  List<Object> get props => [message];
}

class UnexpectedFailure extends Failure {
  @override
  final String message;

  const UnexpectedFailure([String? message])
      : message = message ?? "System in Error, contact our admin to fix this issue";

  @override
  List<Object> get props => [message];
}
