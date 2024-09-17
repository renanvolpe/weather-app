

import 'package:dartz/dartz.dart';

import '../../../core/utils/constants/abstract_usecase.dart';
import '../../../core/utils/constants/failure.dart';
import '../../data/model/weather_model/weather_model.dart';
import '../abstract_respository/abstract_get_weather_repository.dart';

class GetListWeatherInformationUseCase extends IUseCase<NoParam, List<WeatherModel>> {
  IGetWeatherRepository repository;
  GetListWeatherInformationUseCase({
    required this.repository,
  });
  @override
  Future<Either<Failure, List<WeatherModel>>> call(params) async {
    var response = await repository.getListWeatherInformationLocal();
    return response.fold((failure) {
      return Left(failure);
    }, (success) {
      return Right(success);
    });
  }
}
