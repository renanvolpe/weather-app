// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';
import 'package:weather_app/modules/weather/data/model/weather_model/weather_model.dart';
import 'package:weather_app/modules/weather/presenter/state/bloc/post_weather_local/post_weather_local_bloc.dart';

import '../state/bloc/get_weather/get_weather_information_bloc.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late TextEditingController weatherTextController;
  late GetWeatherBloc getWeatherBloc;

  @override
  void initState() {
    weatherTextController = TextEditingController();
    getWeatherBloc = Modular.get<GetWeatherBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather here"),
        actions: const [Icon(Icons.saved_search), Gap(15)],
      ),
      body: Column(
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
          BlocBuilder<GetWeatherBloc, GetWeatherState>(
            bloc: getWeatherBloc,
            builder: (context, state) {
              return switch (state) {
                (GetWeatherFailure()) => Text("Error: ${state.message}"),
                (GetWeatherProgress()) => const CircularProgressIndicator(),
                (GetWeatherInitial()) => const Text("Tap a city to discover the Weather"),
                (GetWeatherSuccess()) => Column(
                    children: [
                      FavoriteIcon(weatherModel: state.weatherModel),
                      Text(
                          "success: ${state.weatherModel.location.name}, Weather: ${state.weatherModel.current.temp_c}"),
                      TextButton(
                          onPressed: () => Modular.to.pushNamed("./forecast", arguments: weatherTextController.text),
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

// ignore: must_be_immutable
class FavoriteIcon extends StatelessWidget {
  FavoriteIcon({
    super.key,
    required this.weatherModel,
  });

  final WeatherModel weatherModel;

  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    PostWeatherLocalBloc postWeatherLocalBloc = Modular.get<PostWeatherLocalBloc>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        StatefulBuilder(builder: (context, setState) {
          return IconButton(
              onPressed: () {
                postWeatherLocalBloc.add(PostWeatherLocalStarted(weatherModel));
                setState(() => isFavorite = !isFavorite);
              },
              icon: isFavorite
                  ? const Icon(Icons.favorite, color: Colors.red)
                  : const Icon(Icons.favorite_border, color: Colors.black));
        })
      ],
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
