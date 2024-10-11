import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/modules/shared/state_controller.dart';

import '../../../../app_service.dart';
import '../../../core/style/app_color.dart';
import '../../../core/style/text_style.dart';
import '../../domain/params/get_weather_params.dart';
import '../state/bloc/get_weather/get_weather_information_bloc.dart';
import '../state/riverpod/get_weather/get_weather_provider.dart';

class TextFieldWeather extends StatelessWidget {
  final TextEditingController weatherTextController = TextEditingController();

  TextFieldWeather({super.key});

  @override
  Widget build(BuildContext context) {
    var state = Modular.get<AppService>().state;

    return switch (state) {
      StateManagement.bloc => TextFieldWeatherBloc(),
      StateManagement.riverpod => TextFieldWeatherRiverpod(),
      // StateManagement.bloc => TextFieldWeatherBloc(),
      _ => const Text("Not implemented yet it this State"),
    };
  }
}

class TextFieldWeatherBloc extends StatelessWidget {
  final TextEditingController weatherTextController = TextEditingController();

  TextFieldWeatherBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: AppColor.kgrey3,
          hintText: "Search city location",
          hintStyle: Style.greyLightStyle,
          suffixIcon: IconButton(
            onPressed: () {
              Modular.get<GetWeatherBloc>().add(GetWeather(GetWeatherParams(text: weatherTextController.text)));
              FocusScope.of(context).unfocus();
            },
            icon: const Icon(
              Icons.search,
              color: AppColor.kgrey2,
            ),
          )),
      controller: weatherTextController,
      onChanged: (value) => weatherTextController.text = value,
    );
  }
}

class TextFieldWeatherRiverpod extends ConsumerWidget {
  final TextEditingController weatherTextController = TextEditingController();

  TextFieldWeatherRiverpod({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return TextField(
      autofocus: false,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: AppColor.kgrey3,
          hintText: "Search city location",
          hintStyle: Style.greyLightStyle,
          suffixIcon: IconButton(
            onPressed: () {
              GetWeatherParams params = GetWeatherParams(text: weatherTextController.text);
              ref.read(getWeatherProvider.notifier).getlistWeather(params);
              FocusScope.of(context).unfocus();
            },
            icon: const Icon(
              Icons.search,
              color: AppColor.kgrey2,
            ),
          )),
      controller: weatherTextController,
      onChanged: (value) => weatherTextController.text = value,
    );
  }
}
