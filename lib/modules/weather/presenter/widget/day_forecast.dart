import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/style/app_color.dart';
import '../../../core/style/text_style.dart';
import 'line_chart.dart';

class DayForecast extends StatelessWidget {
  const DayForecast({
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
                  Icons.calendar_month,
                  size: 20,
                  color: AppColor.kBlack,
                ),
              )),
              const Gap(10),
              Text(
                "Day forecast",
                style: Style.darkStyle,
              ),
            ],
          ),
          const DayForecastLineChart()
        ],
      ),
    );
  }
}
