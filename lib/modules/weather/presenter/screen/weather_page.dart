// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';

import '../../../core/style/app_color.dart';
import '../../../core/style/text_style.dart';
import '../state/bloc/get_list_weather_local/get_list_weather_information_local_bloc.dart';
import '../state/bloc/get_weather/get_weather_information_bloc.dart';
import '../widget/btn_day.dart';
import '../widget/day_forecast.dart';
import '../widget/favorite_icon.dart';
import '../widget/forecast_week.dart';
import '../widget/rain_chance.dart';
import '../widget/weather_feature.dart';
import '../widget/weather_listtile.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late TextEditingController weatherTextController;
  late GetWeatherBloc getWeatherBloc;
  late GetListWeatherLocalBloc getListWeatherLocalBloc;

  @override
  void initState() {
    weatherTextController = TextEditingController();
    getWeatherBloc = Modular.get<GetWeatherBloc>();

    getWeatherBloc.add(const GetWeather("Sao jose dos campos")); //Start with my city

    getListWeatherLocalBloc = Modular.get<GetListWeatherLocalBloc>();
    getListWeatherLocalBloc.add(GetListWeatherLocalStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhite,
      appBar: AppBar(
        backgroundColor: AppColor.kWhite,
        surfaceTintColor: AppColor.kWhite,
        leading: IconButton(onPressed: () => Modular.to.pop(), icon: const Icon(Icons.chevron_left)),
        title: Text(
          "Weather",
          style: Style.darkStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFieldWeather(weatherTextController),
            const Gap(10),
            BtnDayDefault(
              title: "Search Weather City",
              onTap: () {
                String text = weatherTextController.text;
                getWeatherBloc.add(GetWeather(text));
              },
            ),
            const Gap(10),
            BlocBuilder<GetWeatherBloc, GetWeatherState>(
              bloc: getWeatherBloc,
              builder: (context, state) {
                return switch (state) {
                  (GetWeatherFailure()) => Text("Error: ${state.message}"),
                  (GetWeatherProgress()) => const CircularProgressIndicator(),
                  (GetWeatherInitial()) => const Text("Tap a city to discover the Weather"),
                  (GetWeatherSuccess()) => Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                            color: AppColor.kBackgroundLight,
                            borderRadius: BorderRadius.circular(15),
                            gradient: const LinearGradient(colors: [
                              AppColor.kPrimaryLight,
                              AppColor.kPrimary,
                            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: AppColor.kWhite,
                                ),
                                Center(
                                  child: Column(
                                    children: [
                                      Text(
                                        state.weatherModel.location.name,
                                        style: Style.defaultLightStyle.copyWith(fontSize: 22),
                                      ),
                                      Text(
                                        "${state.weatherModel.location.region} | ${state.weatherModel.location.country}",
                                        style: Style.defaultLightStyle.copyWith(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                                // const Gap(15),
                                // const Spacer(),
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
                                      style: Style.defaultLightStyle.copyWith(fontSize: 60),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: Text(
                                        "ºC",
                                        style: Style.defaultLightStyle.copyWith(fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  state.weatherModel.current.condition.text,
                                  style: Style.defaultLightStyle.copyWith(fontSize: 40),
                                ),
                                const Gap(10),
                                Text(
                                  state.weatherModel.location.localtime,
                                  style: Style.defaultLightStyle,
                                ),
                                const Divider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "${state.weatherModel.current.feelslike_c}ºC",
                                          style: Style.defaultLightStyle
                                              .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Feels like",
                                          style: Style.defaultLightStyle.copyWith(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "${state.weatherModel.current.humidity}%",
                                          style: Style.defaultLightStyle
                                              .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Humidity",
                                          style: Style.defaultLightStyle.copyWith(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "${state.weatherModel.current.wind_kph}Km/h",
                                          style: Style.defaultLightStyle
                                              .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Wind",
                                          style: Style.defaultLightStyle.copyWith(fontSize: 14),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [],
                                ),
                                Gap(15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [],
                                ),
                              ],
                            ),
                            const Gap(15),
                            BtnDayDefault(
                              title: "7 Days Forecast",
                              onTap: () => Modular.to.pushNamed("./forecast", arguments: weatherTextController.text),
                            ),
                            const Gap(10),
                          ],
                        ),
                      ),
                    )
                };
              },
            ),
            const Row(
              children: [
                Gap(10),
                Expanded(child: BtnDayPrimary()),
                Gap(10),
                // Expanded(child: BtnDayDefault()),
                // Gap(10),
                // Expanded(child: BtnDayDefault()),
                Gap(10),
              ],
            ),
            const Gap(20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                WeatherFeature(),
                // Gap(10),
                WeatherFeature(),
              ],
            ),
            const Gap(10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                WeatherFeature(),
                // Gap(10),
                WeatherFeature(),
              ],
            ),
            // const Gap(10),
            const Padding(
              padding: EdgeInsets.all(10),
              child: ForecastWeek(),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: DayForecast(),
            ),

            const Padding(
              padding: EdgeInsets.all(10),
              child: RainChance(),
            ),

            const Padding(
              padding: EdgeInsets.all(10),
              child: WeatherListTile(),
            ),

            Text(
              "Saved cities:",
              style: Style.defaultStyle.copyWith(fontSize: 20),
            ),
            BlocBuilder<GetListWeatherLocalBloc, GetListWeatherLocalState>(
              bloc: getListWeatherLocalBloc,
              builder: (context, state) {
                return switch (state) {
                  (GetListWeatherLocalFailure()) => Text("Error: ${state.message}"),
                  (GetListWeatherLocalProgress()) => const CircularProgressIndicator(),
                  (GetListWeatherLocalInitial()) => const Text("Add Some City first"),
                  (GetListWeatherLocalSuccess()) => ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.listWeather.length,
                      itemBuilder: (_, index) {
                        var city = state.listWeather[index];
                        return ListTile(
                          leading: Image.network("http:${city.current.condition.icon}"),
                          title: Text("Name city: ${city.location.name}"),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Temperature: ${city.current.temp_c} ºC"),
                              Text("Feels like: ${city.current.feelslike_c} ºC"),
                            ],
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Modular.to.pushNamed("./forecast", arguments: city.location.name);
                                      },
                                      icon: const Icon(Icons.read_more_rounded)),
                                ],
                              ),
                            ],
                          ),
                          isThreeLine: true,
                        );
                      })
                };
              },
            )
          ],
        ),
      ),
    );
  }
}

class TextFieldWeather extends StatelessWidget {
  final TextEditingController weatherTextController;

  const TextFieldWeather(this.weatherTextController, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: TextField(
        autofocus: false,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            hintText: "Choose your city",
            suffixIcon: const Icon(Icons.search)),
        controller: weatherTextController,
        onChanged: (value) => weatherTextController.text = value,
      ),
    );
  }
}
