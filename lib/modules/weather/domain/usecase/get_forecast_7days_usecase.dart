// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import '../../../core/utils/constants/abstract_usecase.dart';
import '../../../core/utils/constants/failure.dart';
import '../../data/model/forecastday/forecastday_model.dart';
import '../abstract_respository/abstract_get_forecast_repository.dart';

class GetForecast7daysUsecase extends IUseCase<ForecastParam, List<ForecastdayModel>> {
  IGetForecastRepository repository;
  GetForecast7daysUsecase({
    required this.repository,
  });
  @override
  Future<Either<Failure, List<ForecastdayModel>>> call(ForecastParam params) async {
    var response = await repository.getForecastInformation(params);
    return response.fold((failure) {
      return Left(failure);
    }, (success) {
      return Right(success);
    });
  }
}

class ForecastParam {
  String text;
  int days;
  ForecastParam({
    required this.text,
    required this.days,
  });
}
