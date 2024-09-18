import 'package:dartz/dartz.dart';

import '../../../core/utils/abstract_usecase.dart';
import '../../../core/utils/failure.dart';
import '../../data/model/weather_model/weather_model.dart';
import '../abstract_respository/abstract_get_weather_repository.dart';

class GetWeatherLocalUseCase extends IUseCase<int, WeatherModel> {
  IWeatherRepository repository;
  GetWeatherLocalUseCase({
    required this.repository,
  });
  @override
  Future<Either<Failure, WeatherModel>> call(params) async {
    var response = await repository.getWeatherLocal(params);
    return response.fold((failure) {
      return Left(failure);
    }, (success) {
      return Right(success);
    });
  }
}
