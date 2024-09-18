

import 'package:dartz/dartz.dart';

import '../../../core/utils/abstract_usecase.dart';
import '../../../core/utils/failure.dart';
import '../../data/model/weather_model/weather_model.dart';
import '../abstract_respository/abstract_get_weather_repository.dart';

class PostWeatherLocalUseCase extends IUseCase<WeatherModel, int> {
  IWeatherRepository repository;
  PostWeatherLocalUseCase({
    required this.repository,
  });
  @override
  Future<Either<Failure, int>> call(WeatherModel params) async {
    var response = await repository.postWeatherLocal(params);
    return response.fold((failure) {
      return Left(failure);
    }, (success) {
      return Right(success);
    });
  }
}

