// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/app_service.dart';
import 'package:weather_app/modules/shared/state_controller.dart';
import 'package:weather_app/modules/weather/presenter/state/riverpod/get_weather/get_weather_provider.dart';
import 'package:weather_app/modules/weather/presenter/state/riverpod/get_weather/get_weather_state.dart';

import '../state/bloc/get_weather/get_weather_information_bloc.dart';
import 'get_weather_success_widget.dart';

class CurrentWeatherCard extends StatefulWidget {
  const CurrentWeatherCard({
    super.key,
  });

  @override
  State<CurrentWeatherCard> createState() => _CurrentWeatherCardState();
}

class _CurrentWeatherCardState extends State<CurrentWeatherCard> {
  @override
  Widget build(BuildContext context) {
    var state = Modular.get<AppService>().state;
    return switch (state) {
      (StateManagement.bloc) => const CurrentWeatherCardBloc(),
      (StateManagement.riverpod) => const CurrentWeatherCardRiverpod(),
      _ => const Text("Not Implemented Yet")
    };
  }
}

class CurrentWeatherCardBloc extends StatefulWidget {
  const CurrentWeatherCardBloc({
    super.key,
  });

  @override
  State<CurrentWeatherCardBloc> createState() => _CurrentWeatherCardBlocState();
}

class _CurrentWeatherCardBlocState extends State<CurrentWeatherCardBloc> {
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
          (GetWeatherSuccess()) => GetWeatherSuccessWidget(weather: state.weatherModel),
        };
      },
    );
  }
}

class CurrentWeatherCardRiverpod extends ConsumerWidget {
  const CurrentWeatherCardRiverpod({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var state = ref.watch(getWeatherProvider);
    
    return switch (state) {
      (ErrorState()) => Text("Error: ${state.exception.message}"),
      (SuccessState()) => GetWeatherSuccessWidget(weather: state.weather),
      (Loading()) => const CircularProgressIndicator(),
      _ => const Text("Tap a city to discover the Weather")
    };
  }
}
