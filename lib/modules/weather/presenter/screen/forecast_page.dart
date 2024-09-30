import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';
import 'package:weather_app/modules/weather/domain/usecase/get_forecast_7days_usecase.dart';
import 'package:weather_app/modules/weather/presenter/state/bloc/get_forecast_7days/get_forecast7_days_bloc.dart';

import '../../../core/style/text_style.dart';
import '../widget/forecast_detail_card.dart';
import '../widget/forecast_week.dart';
import '../widget/rain_chance.dart';
import '../widget/weather_feature.dart';

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
        title: Text("Forecast 3 days", style: Style.darkStyle.copyWith(fontSize: 18)),
      ),
      body: BlocBuilder<GetForecast7DaysBloc, GetForecast7DaysState>(
        bloc: getForecast7DaysBloc,
        builder: (context, state) {
          return switch (state) {
            (GetForecast7DaysFailure()) => Text("Error: ${state.message}"),
            (GetForecast7DaysProgress()) => const CircularProgressIndicator(),
            (GetForecast7DaysInitial()) => const Text("Tap a city to discover the Weather"),
            (GetForecast7DaysSuccess()) => SingleChildScrollView(
                child: Column(
                  children: [
                    const ForecastDetailCard(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: WeatherFeature(
                              icon: Icons.water_drop,
                              title: "Humidity",
                              value: "${state.list[0].day.avghumidity} %",
                            ),
                          ),
                          const Gap(10),
                          Expanded(
                            child: WeatherFeature(
                              icon: Icons.thermostat,
                              title: "Max Temp",
                              value: "${state.list[0].day.maxtemp_c} ºC",
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: WeatherFeature(
                              icon: Icons.thermostat,
                              title: "Min Temp",
                              value: "${state.list[0].day.mintemp_c} ºC",
                            ),
                          ),
                          const Gap(10),
                          Expanded(
                            child: WeatherFeature(
                              icon: Icons.wind_power,
                              title: "Max Wind",
                              value: "${state.list[0].day.maxwind_kph} Km/h",
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(10),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: ForecastWeek(),
                    ),
                    const Gap(10),
                    const RainChance(),
                    Center(
                      child: Text("maxTemp: ${state.list.first.day.maxtemp_c}, avg: ${state.list.first.day.avgtemp_c}"),
                    ),
                  ],
                ),
              )
          };
        },
      ),
    );
  }
}
