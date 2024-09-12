import 'package:dartz/dartz.dart';
import 'package:weather_app/modules/shared/dio/dio_service.dart';
import 'package:weather_app/modules/weather/data/abstract_datasource/abstract_weather_datasource.dart';
import 'package:weather_app/modules/weather/data/model/weather_model/weather_model.dart';

import '../../../core/utils/constants/endpoint.dart';
import '../../../core/utils/constants/failure.dart';

class WeatherDatasourceImpl implements IWeatherDatasource {
  //localInstance
  final DioClient dioClient;

  WeatherDatasourceImpl(this.dioClient);

  @override
  Future<Either<Failure, WeatherModel>> getWatherLocal(String text) async {
    return const Left(ServerFailure());
  }

  @override
  Future<Either<Failure, WeatherModel>> getWeatherApi(String text) async {
    Map<String, String>? params = {"q": text};
    var response = await dioClient.dioGet(endpoint: Endpoint.current, params: params);
    return response.fold((success) {
     var weatherModel = WeatherModel.fromMap(success);
      return Right(weatherModel);
    }, (failure) {
      return Left(failure);
    });
  }
}
