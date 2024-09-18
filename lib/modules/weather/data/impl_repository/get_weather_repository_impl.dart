// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:weather_app/modules/core/utils/failure.dart';
import 'package:weather_app/modules/weather/data/model/weather_model/weather_model.dart';
import 'package:weather_app/modules/weather/domain/abstract_respository/abstract_get_weather_repository.dart';

import '../abstract_datasource/abstract_weather_datasource.dart';

class GetWeatherRepositoryImpl implements IWeatherRepository {
  IWeatherDatasourceApi datasource;
  IWeatherDatasourceLocal datasourceLocal;

  GetWeatherRepositoryImpl({
    required this.datasource,
    required this.datasourceLocal,
  });

  @override
  Future<Either<Failure, WeatherModel>> getWeather(String text) async {
    var response = await datasource.getWeatherApi(text);
    return response.fold((failure) => Left(failure), (success) => Right(success));
  }

  @override
  Future<Either<Failure, WeatherModel>> getWeatherLocal(int id) async {
    var response = await datasourceLocal.getWeather(id);
    return response.fold((failure) => Left(failure), (success) => Right(success));
  }

  @override
  Future<Either<Failure, List<WeatherModel>>> getListWeatherLocal() async {
    var response = await datasourceLocal.getListWeather();
    return response.fold((failure) => Left(failure), (success) => Right(success));
  }
  
  @override
  Future<Either<Failure, int>> postWeatherLocal(WeatherModel weather) async{
        var response = await datasourceLocal.saveWeather(weather);
    return response.fold((failure) => Left(failure), (success) => Right(success));
  }
  
  @override
  Future<Either<Failure, int>> deletetWeatherLocal(int id) async{
        var response = await datasourceLocal.deleteWeather(id);
    return response.fold((failure) => Left(failure), (success) => Right(success));
  }
}
