import 'package:dartz/dartz.dart';
import 'package:weather_app/modules/core/utils/constants/failure.dart';
import 'package:weather_app/modules/weather/data/model/forecastday/forecastday_model.dart';
import 'package:weather_app/modules/weather/domain/usecase/get_forecast_7days_usecase.dart';

import '../../../core/utils/constants/endpoint.dart';
import '../../../shared/dio/dio_service.dart';
import '../abstract_datasource/abstract_forecast_datasource.dart';

class ForecastDatasourceImpl implements IForecastDatasource {
  DioService dioClient;

  ForecastDatasourceImpl({
    required this.dioClient,
  });

  @override
  Future<Either<Failure, List<ForecastdayModel>>> getForecastApi(ForecastParam param) async {
    Map<String, String>? params = {"q": param.text, "days": param.days.toString()};
    var response = await dioClient.dioGet(endpoint: Endpoint.forecast, params: params);

    return response.fold((failure) {
      return Left(failure);
    }, (success) {
      List<ForecastdayModel> list = [];
      for (var e in success["forecast"]["forecastday"]) {
        list.add(ForecastdayModel.fromMap(e));
      }
      return Right(list);
    });
  }
}
