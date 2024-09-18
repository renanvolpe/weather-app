import 'package:dartz/dartz.dart';

import '../../../core/utils/failure.dart';
import '../../data/model/forecastday/forecastday_model.dart';
import '../usecase/get_forecast_7days_usecase.dart';

abstract class IGetForecastRepository {
  Future<Either<Failure, List<ForecastdayModel>>> getForecastInformation(ForecastParam param);
}
