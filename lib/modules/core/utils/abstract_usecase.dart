import 'package:dartz/dartz.dart';

import 'failure.dart';

abstract class IUseCase<Input, Output> {
  Future<Either<Failure, Output>> call(Input params);
}

class NoParam{}