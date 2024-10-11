// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';

import '../../../core/style/app_color.dart';
import '../../../core/style/text_style.dart';
import '../widget/current_weather_card.dart';
import '../widget/text_field_weather.dart';
import '../widget/weather_saved.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhite,
      appBar: AppBar(
        backgroundColor: AppColor.kWhite,
        surfaceTintColor: AppColor.kWhite,
        leading: IconButton(onPressed: () => Modular.to.pop(), icon: const Icon(Icons.chevron_left)),
        title: Text("Weather", style: Style.darkStyle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFieldWeather(),
            ),
            const Gap(10),
            const CurrentWeatherCard(),
            const Gap(10),
            const WeathersSaved(),
            const Gap(30)
          ],
        ),
      ),
    );
  }
}
