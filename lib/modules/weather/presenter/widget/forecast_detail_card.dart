import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';

import '../../../core/style/text_style.dart';
import '../state/bloc/get_weather/get_weather_information_bloc.dart';

class ForecastDetailCard extends StatefulWidget {
  const ForecastDetailCard({
    super.key,
  });

  @override
  State<ForecastDetailCard> createState() => _ForecastDetailCardState();
}

class _ForecastDetailCardState extends State<ForecastDetailCard> {
  late GetWeatherBloc getWeatherBloc;
  late TextEditingController weatherTextController;

  @override
  void initState() {
    super.initState();
    getWeatherBloc = Modular.get<GetWeatherBloc>();
    weatherTextController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherBloc, GetWeatherState>(
      bloc: getWeatherBloc,
      builder: (context, state) {
        return switch (state) {
          (GetWeatherFailure()) => Text("Error: ${state.message}"),
          (GetWeatherProgress()) => const SizedBox(height: 100, child: Center(child: CircularProgressIndicator())),
          (GetWeatherInitial()) => const Text("Tap a city to discover the Weather"),
          (GetWeatherSuccess()) => Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                  // color: AppColor.kgrey3,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              state.weatherModel.location.name,
                              style: Style.darkStyle.copyWith(fontSize: 22),
                            ),
                            Text(
                              "${state.weatherModel.location.region} | ${state.weatherModel.location.country}",
                              style: Style.darkStyle.copyWith(fontSize: 15),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Gap(20),
                    Column(
                      children: [
                        SizedBox(
                            height: 110,
                            width: 110,
                            child: Image.network(
                              "http:${state.weatherModel.current.condition.icon}",
                              fit: BoxFit.fill,
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${state.weatherModel.current.temp_c}",
                              style: Style.darkStyle.copyWith(fontSize: 60),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Text(
                                "ºC",
                                style: Style.darkStyle.copyWith(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          state.weatherModel.current.condition.text,
                          style: Style.darkStyle.copyWith(fontSize: 40),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
        };
      },
    );
  }
}
