import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';
import 'package:weather_app/modules/weather/presenter/widget/btn_day.dart';
import 'package:weather_app/modules/weather/presenter/widget/favorite_icon.dart';

import '../../../core/style/app_color.dart';
import '../../../core/style/text_style.dart';
import '../../../core/utils/date_intl.dart';
import '../../data/model/weather_model/weather_model.dart';

class GetWeatherSuccessWidget extends StatelessWidget {
  const GetWeatherSuccessWidget({
    super.key,
    required this.weather,
  });
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                      weather.location.name,
                      style: Style.darkStyle.copyWith(fontSize: 22),
                    ),
                    Text(
                      "${weather.location.region} | ${weather.location.country}",
                      style: Style.darkStyle.copyWith(fontSize: 15),
                    ),
                  ],
                ),
                const Spacer(),
                FavoriteIcon(weatherModel: weather),
              ],
            ),
            const Gap(20),
            Column(
              children: [
                SizedBox(
                    height: 110,
                    width: 110,
                    child: Image.network(
                      "http:${weather.current.condition.icon}",
                      fit: BoxFit.fill,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${weather.current.temp_c}",
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
                  weather.current.condition.text,
                  style: Style.darkStyle.copyWith(fontSize: 40),
                ),
                const Gap(10),
                Text(
                  DateIntl.stringToDateHome(weather.location.localtime),
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
                          "${weather.current.feelslike_c}ºC",
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
                          "${weather.current.humidity}%",
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
                          "${weather.current.wind_kph}Km/h",
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
              onTap: () => Modular.to.pushNamed("./forecast", arguments: weather.location.name),
            ),
            // const Gap(10),
          ],
        ),
      ),
    );
  }
}
