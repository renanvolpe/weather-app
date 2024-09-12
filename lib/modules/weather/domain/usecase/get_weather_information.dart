// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import '../../../core/utils/constants/abstract_usecase.dart';
import '../../../core/utils/constants/failure.dart';
import '../../data/model/weather_model.dart';
import '../abstract_respository/abstract_get_weather_repository.dart';

class GetWeatherInformation extends IUseCase<String, WeatherModel> {
  IGetWeatherRepository repository;
  GetWeatherInformation({
    required this.repository,
  });
  @override
  Future<Either<Failure, WeatherModel>> call(params) async {
    var response = await repository.getWeatherInformation(params);
    response.fold((failure) {
      return Left(failure);
    }, (success) {
      Right(success);
    });
    return const Left(ServerFailure());
  }
}
