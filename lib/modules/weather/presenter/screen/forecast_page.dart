import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/modules/weather/domain/usecase/get_forecast_7days_usecase.dart';
import 'package:weather_app/modules/weather/presenter/state/bloc/get_forecast_7days/get_forecast7_days_bloc.dart';

class ForecastPage extends StatefulWidget {
  const ForecastPage({super.key, required this.text});

  final String text;
  @override
  State<ForecastPage> createState() => _ForecastPageState();
}

class _ForecastPageState extends State<ForecastPage> {
  late GetForecast7DaysBloc getForecast7DaysBloc;

  @override
  void initState() {
    getForecast7DaysBloc = Modular.get<GetForecast7DaysBloc>();
    var param = ForecastParam(text: widget.text, days: 7);
    getForecast7DaysBloc.add(GetForecast7Days(param));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forecast 7 days"),
      ),
      body: BlocBuilder<GetForecast7DaysBloc, GetForecast7DaysState>(
        bloc: getForecast7DaysBloc,
        builder: (context, state) {
          return switch (state) {
            (GetForecast7DaysFailure()) => Text("Error: ${state.message}"),
            (GetForecast7DaysProgress()) => const CircularProgressIndicator(),
            (GetForecast7DaysInitial()) => const Text("Tap a city to discover the Weather"),
            (GetForecast7DaysSuccess()) => Center(
                child: Text("maxTemp: ${state.list.first.day.maxtemp_c}, avg: ${state.list.first.day.avgtemp_c}"),
              )
          };
        },
      ),
    );
  }
}
