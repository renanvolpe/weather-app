import 'package:dartz/dartz.dart';

import '../../../core/utils/abstract_usecase.dart';
import '../../../core/utils/failure.dart';
import '../abstract_respository/abstract_get_weather_repository.dart';

class DeleteWeatherLocalUsecase extends IUseCase<int, int> {
  IWeatherRepository repository;
  DeleteWeatherLocalUsecase({
    required this.repository,
  });
  @override
  Future<Either<Failure, int>> call(int params) async {
    var response = await repository.deletetWeatherLocal(params);
    return response.fold((failure) {
      return Left(failure);
    }, (success) {
      return Right(success);
    });
  }
}
