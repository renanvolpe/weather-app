import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';

import '../../../core/style/app_color.dart';
import '../../../core/style/text_style.dart';
import '../../../core/utils/date_intl.dart';
import '../state/bloc/get_weather/get_weather_information_bloc.dart';
import 'btn_day.dart';
import 'favorite_icon.dart';

class CurrentWeatherCard extends StatefulWidget {
  const CurrentWeatherCard({
    super.key,
  });

  @override
  State<CurrentWeatherCard> createState() => _CurrentWeatherCardState();
}

class _CurrentWeatherCardState extends State<CurrentWeatherCard> {
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
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                        const Spacer(),
                        FavoriteIcon(weatherModel: state.weatherModel),
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
                        const Gap(10),
                        Text(
                          DateIntl.stringToDateHome(state.weatherModel.location.localtime),
                          style: Style.darkStyle,
                        ),
                        const Gap(5),
                        const Divider(
                          color: AppColor.kgrey2,
                        ),
                        const Gap(5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Feels like",
                                  style: Style.darkStyle.copyWith(fontSize: 12),
                                ),
                                Text(
                                  "${state.weatherModel.current.feelslike_c}ºC",
                                  style: Style.darkStyle.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "Humidity",
                                  style: Style.darkStyle.copyWith(fontSize: 12),
                                ),
                                Text(
                                  "${state.weatherModel.current.humidity}%",
                                  style: Style.darkStyle.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "Wind",
                                  style: Style.darkStyle.copyWith(fontSize: 12),
                                ),
                                Text(
                                  "${state.weatherModel.current.wind_kph}Km/h",
                                  style: Style.darkStyle.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    const Gap(15),
                    BtnDayDefault(
                      title: "7 Days Forecast",
                      onTap: () => Modular.to.pushNamed("./forecast", arguments: weatherTextController.text),
                    ),
                    // const Gap(10),
                  ],
                ),
              ),
            )
        };
      },
    );
  }
}
