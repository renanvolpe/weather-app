import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';

import '../../../core/style/app_color.dart';
import '../../../core/style/text_style.dart';
import '../../../core/utils/date_intl.dart';
import '../../../weather/presenter/state/bloc/get_list_weather_local/get_list_weather_information_local_bloc.dart';

class WeatherOfflinePage extends StatelessWidget {
  const WeatherOfflinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Offline Weather", style: Style.darkStyle),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Saved Weathers", style: Style.darkStyle.copyWith(fontSize: 20, fontWeight: FontWeight.bold)),
            const WeathersOfflineSaved()
          ],
        ),
      ),
    );
  }
}

class WeathersOfflineSaved extends StatefulWidget {
  const WeathersOfflineSaved({
    super.key,
  });

  @override
  State<WeathersOfflineSaved> createState() => _WeathersOfflineSavedState();
}

class _WeathersOfflineSavedState extends State<WeathersOfflineSaved> {
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
          (GetListWeatherLocalInitial()) => Text("Add Some Weather first", style: Style.darkStyle),
          (GetListWeatherLocalSuccess()) => Column(
              children: [
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.listWeather.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
                            decoration: BoxDecoration(
                                color: AppColor.kBackgroundLight, borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.listWeather[index].location.name,
                                      style: Style.defaultStyle.copyWith(fontWeight: FontWeight.w600),
                                    ),
                                    const Gap(10),
                                    Text(
                                      DateIntl.stringToDateCard(state.listWeather[index].location.localtime),
                                      style: Style.defaultStyle.copyWith(fontSize: 13),
                                    ),
                                    Text(
                                      state.listWeather[index].current.condition.text,
                                      style: Style.defaultStyle.copyWith(fontSize: 14),
                                    )
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text("${state.listWeather[index].current.temp_c} ºC",
                                        style: Style.defaultStyle.copyWith(fontSize: 14)),
                                    const Gap(10),
                                    Text(
                                      "${state.listWeather[index].current.temp_f} ºF",
                                      style: Style.defaultStyle.copyWith(fontSize: 14),
                                    )
                                  ],
                                ),
                              ],
                            )),
                      );
                    }),
              ],
            )
        };
      },
    );
  }
}
