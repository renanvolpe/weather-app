// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/style/app_color.dart';
import '../../../core/style/text_style.dart';

class WeatherFeature extends StatelessWidget {
  const WeatherFeature({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(color: AppColor.kBackgroundLight, borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipOval(
                child: Container(
              padding: const EdgeInsets.all(5),
              color: AppColor.kWhite,
              child: Icon(
                icon,
                size: 20,
                color: AppColor.kBlack,
              ),
            )),
            const Gap(20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Style.darkStyle.copyWith(fontSize: 16),
                ),
                const Gap(10),
                Text(
                  value,
                  style: Style.darkStyle.copyWith(fontSize: 14),
                ),
              ],
            ),
          ],
        ));
  }
}
