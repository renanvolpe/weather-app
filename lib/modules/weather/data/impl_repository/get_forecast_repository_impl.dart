import 'package:dartz/dartz.dart';

import '../../../core/utils/constants/failure.dart';
import '../../domain/abstract_respository/abstract_get_forecast_repository.dart';
import '../../domain/usecase/get_forecast_7days_usecase.dart';
import '../abstract_datasource/abstract_forecast_datasource.dart';
import '../model/forecastday/forecastday_model.dart';

class GetWeatherRepositoryImpl implements IGetForecastRepository {
  IForecastDatasource datasource;

  GetWeatherRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure,  List<ForecastdayModel>>> getForecastInformation(ForecastParam param) async {
    var response = await datasource.getForecastApi(param);
    return response.fold((failure) => Left(failure), (success) => Right(success));
  }
}
