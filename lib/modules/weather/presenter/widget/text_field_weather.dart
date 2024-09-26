import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/style/app_color.dart';
import '../../../core/style/text_style.dart';
import '../state/bloc/get_weather/get_weather_information_bloc.dart';


class TextFieldWeather extends StatelessWidget {
  final TextEditingController weatherTextController = TextEditingController();

  TextFieldWeather({super.key});

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
            onPressed: () => Modular.get<GetWeatherBloc>().add(GetWeather(text: weatherTextController.text)),
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
