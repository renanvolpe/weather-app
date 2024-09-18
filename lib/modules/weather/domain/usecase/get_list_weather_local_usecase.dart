

import 'package:dartz/dartz.dart';

import '../../../core/utils/abstract_usecase.dart';
import '../../../core/utils/failure.dart';
import '../../data/model/weather_model/weather_model.dart';
import '../abstract_respository/abstract_get_weather_repository.dart';

class GetListWeatherLocalUseCase extends IUseCase<NoParam, List<WeatherModel>> {
  IWeatherRepository repository;
  GetListWeatherLocalUseCase({
    required this.repository,
  });
  @override
  Future<Either<Failure, List<WeatherModel>>> call(params) async {
    var response = await repository.getListWeatherLocal();
    return response.fold((failure) {
      return Left(failure);
    }, (success) {
      return Right(success);
    });
  }
}
