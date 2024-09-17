// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:weather_app/modules/core/utils/constants/failure.dart';
import 'package:weather_app/modules/weather/data/model/weather_model/weather_model.dart';
import 'package:weather_app/modules/weather/domain/abstract_respository/abstract_get_weather_repository.dart';

import '../abstract_datasource/abstract_weather_datasource.dart';

class GetWeatherRepositoryImpl implements IGetWeatherRepository {
  IWeatherDatasourceApi datasource;
  IWeatherDatasourceLocal datasourceLocal;

  GetWeatherRepositoryImpl({
    required this.datasource,
    required this.datasourceLocal,
  });

  @override
  Future<Either<Failure, WeatherModel>> getWeatherInformation(String text) async {
    var response = await datasource.getWeatherApi(text);
    return response.fold((failure) => Left(failure), (success) => Right(success));
  }

   @override
  Future<Either<Failure, WeatherModel>> getWeatherInformationLocal(int id) async {
    var response = await datasourceLocal.getWeather(id);
    return response.fold((failure) => Left(failure), (success) => Right(success));
  }
  
  @override
  Future<Either<Failure, List<WeatherModel>>> getListWeatherInformationLocal(int id) {
    // TODO: implement getListWeatherInformationLocal
    throw UnimplementedError();
  }
}
