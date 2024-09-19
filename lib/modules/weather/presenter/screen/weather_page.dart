// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';

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
    getListWeatherLocalBloc = Modular.get<GetListWeatherLocalBloc>();
    getListWeatherLocalBloc.add(GetListWeatherLocalStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather here"),
        actions: const [Icon(Icons.notifications), Gap(15)],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFieldWeather(weatherTextController),
            TextButton(
                onPressed: () {
                  String text = weatherTextController.text;
                  getWeatherBloc.add(GetWeather(text));
                },
                child: const Column(
                  children: [Text("Search Weather City")],
                )),
            const Row(
              children: [
                Gap(10),
                Expanded(child: BtnDayPrimary()),
                Gap(10),
                Expanded(child: BtnDayDefault()),
                Gap(10),
                Expanded(child: BtnDayDefault()),
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

            BlocBuilder<GetWeatherBloc, GetWeatherState>(
              bloc: getWeatherBloc,
              builder: (context, state) {
                return switch (state) {
                  (GetWeatherFailure()) => Text("Error: ${state.message}"),
                  (GetWeatherProgress()) => const CircularProgressIndicator(),
                  (GetWeatherInitial()) => const Text("Tap a city to discover the Weather"),
                  (GetWeatherSuccess()) => Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "City: ${state.weatherModel.location.name}, Temperature: ${state.weatherModel.current.temp_c} ºC",
                              style: Style.defaultStyle.copyWith(fontSize: 18),
                            ),
                            const Gap(15),
                            FavoriteIcon(weatherModel: state.weatherModel),
                          ],
                        ),
                        TextButton(
                            onPressed: () => Modular.to.pushNamed("./forecast", arguments: weatherTextController.text),
                            child: const Text("Get Forecast Weather"))
                      ],
                    )
                };
              },
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
        decoration: const InputDecoration(hintText: "Choose your city"),
        controller: weatherTextController,
        onChanged: (value) => weatherTextController.text = value,
      ),
    );
  }
}
