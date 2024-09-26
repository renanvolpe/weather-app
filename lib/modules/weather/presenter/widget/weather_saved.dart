import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';

import '../../../core/style/text_style.dart';
import '../state/bloc/get_list_weather_local/get_list_weather_information_local_bloc.dart';
import 'weather_listtile.dart';

class WeathersSaved extends StatefulWidget {
  const WeathersSaved({
    super.key,
  });

  @override
  State<WeathersSaved> createState() => _WeathersSavedState();
}

class _WeathersSavedState extends State<WeathersSaved> {
  late GetListWeatherLocalBloc getListWeatherLocalBloc;
  @override
  void initState() {
    getListWeatherLocalBloc = Modular.get<GetListWeatherLocalBloc>();
    getListWeatherLocalBloc.add(GetListWeatherLocalStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetListWeatherLocalBloc, GetListWeatherLocalState>(
      bloc: getListWeatherLocalBloc,
      builder: (context, state) {
        return switch (state) {
          (GetListWeatherLocalFailure()) => Text(state.message),
          (GetListWeatherLocalProgress()) => const CircularProgressIndicator(),
          (GetListWeatherLocalInitial()) => const Text("Add Some City first"),
          (GetListWeatherLocalSuccess()) => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Gap(15),
                    Text(
                      "Saved cities:",
                      style: Style.darkStyle.copyWith(fontSize: 22),
                    ),
                  ],
                ),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.listWeather.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: WeatherListTile(
                          weather: state.listWeather[index],
                        ),
                      );
                    }),
              ],
            )
        };
      },
    );
  }
}
