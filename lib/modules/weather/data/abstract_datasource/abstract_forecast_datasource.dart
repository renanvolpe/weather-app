import 'package:dartz/dartz.dart';

import '../../../core/utils/failure.dart';
import '../../domain/usecase/get_forecast_7days_usecase.dart';
import '../model/forecastday/forecastday_model.dart';

abstract class IForecastDatasource {
  Future<Either<Failure, List<ForecastdayModel>>> getForecastApi(ForecastParam param);
}
