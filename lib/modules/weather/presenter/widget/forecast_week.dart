
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/style/app_color.dart';
import '../../../core/style/text_style.dart';

class ForecastWeek extends StatelessWidget {
  const ForecastWeek({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(color: AppColor.kBackgroundLight, borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Row(
              children: [
                ClipOval(
                    child: Container(
                  padding: const EdgeInsets.all(5),
                  color: AppColor.kWhite,
                  child: const Icon(
                    Icons.wind_power,
                    size: 20,
                    color: AppColor.kBlack,
                  ),
                )),
                const Gap(10),
                Text(
                  "Hourly Forecast",
                  style: Style.defaultStyle,
                ),
              ],
            ),
            const Gap(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (int i = 0; i < 6; i++) ...[
                  Column(
                    children: [
                      Text(
                        "Now",
                        style: Style.defaultStyle,
                      ),
                      const Gap(3),
                      const Icon(Icons.sunny),
                      const Gap(3),
                      Text(
                        "10ºC",
                        style: Style.defaultStyle,
                      )
                    ],
                  ),
                ],
              ],
            )
          ],
        ));
  }
}