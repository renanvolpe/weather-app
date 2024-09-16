import 'package:dartz/dartz.dart';

import '../../../core/utils/constants/abstract_usecase.dart';
import '../../../core/utils/constants/failure.dart';
import '../../data/model/weather_model/weather_model.dart';
import '../abstract_respository/abstract_get_weather_repository.dart';

class GetWeatherInformationLocalUseCase extends IUseCase<String, WeatherModel> {
  IGetWeatherRepository repository;
  GetWeatherInformationLocalUseCase({
    required this.repository,
  });
  @override
  Future<Either<Failure, WeatherModel>> call(String params) async {
    var response = await repository.getWeatherInformation(params);
    return response.fold((failure) {
      return Left(failure);
    }, (success) {
      return Right(success);
    });
  }
}
