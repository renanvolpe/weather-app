// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../state/bloc/get_weather_information/get_weather_information_bloc.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late TextEditingController weatherTextController;
  late GetWeatherInformationBloc getWeatherInformationBloc;

  @override
  void initState() {
    weatherTextController = TextEditingController();
    getWeatherInformationBloc = Modular.get<GetWeatherInformationBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather here"),
      ),
      body: Column(
        children: [
          TextFieldWeather(weatherTextController),
          TextButton(
              onPressed: () {
                String text = weatherTextController.text;
                getWeatherInformationBloc.add(GetWeatherInformation(text));
              },
              child: const Column(
                children: [Text("Search Weather City")],
              )),
          BlocBuilder<GetWeatherInformationBloc, GetWeatherInformationState>(
            bloc: getWeatherInformationBloc,
            builder: (context, state) {
              return switch (state) {
                (GetWeatherInformationFailure()) => Text("Error: ${state.message}"),
                (GetWeatherInformationProgress()) => const CircularProgressIndicator(),
                (GetWeatherInformationInitial()) => const Text("Tap a city to discover the Weather"),
                (GetWeatherInformationSuccess()) => Column(
                    children: [
                      Text(
                          "success: ${state.weatherModel.location.name}, Weather: ${state.weatherModel.current.temp_c}"),
                      TextButton(
                          onPressed: () => Modular.to.pushNamed("./forecast"),
                          child: const Text("Get Forecast Weather"))
                    ],
                  )
              };
            },
          )
        ],
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
        decoration: const InputDecoration(hintText: "Choose your city"),
        controller: weatherTextController,
        onChanged: (value) => weatherTextController.text = value,
      ),
    );
  }
}
