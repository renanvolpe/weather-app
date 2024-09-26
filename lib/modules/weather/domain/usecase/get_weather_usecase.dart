// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import '../../../core/utils/abstract_usecase.dart';
import '../../../core/utils/failure.dart';
import '../../data/model/weather_model/weather_model.dart';
import '../abstract_respository/abstract_get_weather_repository.dart';
import '../params/get_weather_params.dart';

class GetWeatherUseCase extends IUseCase<GetWeatherParams, WeatherModel> {
  IWeatherRepository repository;
  GetWeatherUseCase({
    required this.repository,
  });
  @override
  Future<Either<Failure, WeatherModel>> call(GetWeatherParams params) async {
    var response = await repository.getWeather(params.text);
    return response.fold((failure) {
      return Left(failure);
    }, (success) {
      if (params.id != null) {
        //if its requesting by a local, it will have a id, so save it
        success.id = params.id;
      }
      return Right(success);
    });
  }
}
