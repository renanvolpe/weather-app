import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/modules/core/utils/failure.dart';
import 'package:weather_app/modules/weather/data/model/weather_model/weather_model.dart';
import 'package:weather_app/modules/weather/domain/params/get_weather_params.dart';
import 'package:weather_app/modules/weather/domain/usecase/get_weather_usecase.dart';
import 'package:weather_app/modules/weather/presenter/state/bloc/get_weather/get_weather_information_bloc.dart';

import '../../../../../../mock.dart';
@GenerateNiceMocks([MockSpec<GetWeatherUseCase>()])
import 'get_weather_bloc_test.mocks.dart';

void main() {
  late WeatherModel weatherModel;
  late GetWeatherBloc blocGetWeather;
  late GetWeatherUseCase mockUsecase;

  mockUsecase = MockGetWeatherUseCase();

  blocGetWeather = GetWeatherBloc(mockUsecase);
  weatherModel = WeatherModel.fromMap(sjcMock);

  group('test bloc get weather from api', () {
    GetWeatherParams params = GetWeatherParams(text: "test1", id: 0);
    setUp(
      () {},
    );
    test("test fake call success", () async {
      when(mockUsecase.call(params)).thenAnswer((_) async => Right<Failure, WeatherModel>(weatherModel));
      var response = await mockUsecase.call(params);
      expect(response, isA<Right>());
    });

    // );
    test('test bloc success', () async {
      when(mockUsecase.call(params)).thenAnswer((_) async => Right<Failure, WeatherModel>(weatherModel));

      blocGetWeather.add(GetWeather(params));

      expectLater(
          blocGetWeather.stream,
          emitsInOrder([
            GetWeatherProgress(),
            GetWeatherSuccess(weatherModel),
          ]));
    });
    test('test bloc failure', () async {
      when(mockUsecase.call(params)).thenAnswer((_) async => const Left<Failure, WeatherModel>(UnexpectedFailure()));

      blocGetWeather.add(GetWeather(params));

      expectLater(
          blocGetWeather.stream,
          emitsInOrder([
            GetWeatherProgress(),
            GetWeatherFailure(const UnexpectedFailure().message),
          ]));
      // verifyNever(mockUsecase.call(params)).called(1);
    });
  });
}
