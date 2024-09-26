// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';
import 'package:weather_app/modules/core/utils/date_intl.dart';
import 'package:weather_app/modules/weather/data/model/weather_model/weather_model.dart';

import '../../../core/style/app_color.dart';
import '../../../core/style/text_style.dart';
import '../state/bloc/get_weather/get_weather_information_bloc.dart';

class WeatherListTile extends StatelessWidget {
  const WeatherListTile({
    super.key,
    required this.weather,
  });
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Modular.get<GetWeatherBloc>().add(GetWeather(weather.location.name)),
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
          decoration: BoxDecoration(color: AppColor.kBackgroundLight, borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    weather.location.name,
                    style: Style.defaultStyle.copyWith(fontWeight: FontWeight.w600),
                  ),
                  const Gap(10),
                  Text(
                    DateIntl.stringToDateCard(weather.location.localtime),
                    style: Style.defaultStyle.copyWith(fontSize: 13),
                  ),
                  Text(
                    weather.current.condition.text,
                    style: Style.defaultStyle.copyWith(fontSize: 14),
                  )
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text("${weather.current.temp_c} ºC", style: Style.defaultStyle.copyWith(fontSize: 14)),
                            const Spacer(),
                            Text(
                              "${weather.current.temp_f} ºF",
                              style: Style.defaultStyle.copyWith(fontSize: 14),
                            )
                          ],
                        ),
                        const Gap(10),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 3),
                          child: VerticalDivider(width: 5, color: AppColor.kgrey2),
                        ),
                        const Gap(6),
                        Image.network("http:${weather.current.condition.icon}"),
                      ],
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
