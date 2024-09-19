import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/style/app_color.dart';
import '../../../core/style/text_style.dart';

class WeatherListTile extends StatelessWidget {
  const WeatherListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
        decoration: BoxDecoration(color: AppColor.kBackgroundLight, borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Today",
                  style: Style.defaultStyle.copyWith(fontWeight: FontWeight.w600),
                ),
                const Gap(10),
                Text(
                  "Cloudy and Sunny",
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
                          Text("30º", style: Style.defaultStyle.copyWith(fontSize: 14)),
                          const Gap(10),
                          Text(
                            "25º",
                            style: Style.defaultStyle.copyWith(fontSize: 14),
                          )
                        ],
                      ),
                      const Gap(6),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 3),
                        child: VerticalDivider(
                          width: 5,
                          color: Colors.black,
                        ),
                      ),
                      const Gap(6),
                      const Text("Icon sunny"),
                    ],
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
