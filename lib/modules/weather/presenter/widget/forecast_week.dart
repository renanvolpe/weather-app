import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';
import 'package:weather_app/modules/core/utils/date_intl.dart';

import '../../../core/style/app_color.dart';
import '../../../core/style/text_style.dart';
import '../state/bloc/get_forecast_7days/get_forecast7_days_bloc.dart';

class ForecastWeek extends StatefulWidget {
  const ForecastWeek({
    super.key,
  });

  @override
  State<ForecastWeek> createState() => _ForecastWeekState();
}

class _ForecastWeekState extends State<ForecastWeek> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetForecast7DaysBloc, GetForecast7DaysState>(
      bloc: Modular.get<GetForecast7DaysBloc>(),
      builder: (context, state) {
        if (state is GetForecast7DaysSuccess) {
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
                        "Average Temperature",
                        style: Style.defaultStyle,
                      ),
                    ],
                  ),
                  const Gap(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      for (int i = 0; i < 3; i++) ...[
                        Column(
                          children: [
                            Text(
                              DateIntl.stringToDateForecast(state.list[i].date),
                              style: Style.defaultStyle,
                            ),
                            const Gap(3),
                            Column(
                              children: [
                                Image.network("https:${state.list[i].day.condition.icon}"),
                                Text(state.list[i].day.condition.text, style: Style.defaultStyle)
                              ],
                            ),
                            const Gap(3),
                            Text(
                              "${state.list[i].day.avgtemp_c}ºC",
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
        return const SizedBox();
      },
    );
  }
}
