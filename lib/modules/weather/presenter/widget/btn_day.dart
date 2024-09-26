import 'package:flutter/material.dart';

import '../../../core/style/app_color.dart';
import '../../../core/style/text_style.dart';

class BtnDayDefault extends StatelessWidget {
  const BtnDayDefault({
    super.key,
    this.onTap,
    required this.title,
  });
  final Function()? onTap;

  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          decoration: BoxDecoration(color: AppColor.kgrey2, borderRadius: BorderRadius.circular(60)),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: Style.defaultLightStyle.copyWith(fontWeight: FontWeight.w600, fontSize: 18),
          )),
    );
  }
}

class BtnDayPrimary extends StatelessWidget {
  const BtnDayPrimary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 7),
          decoration: BoxDecoration(color: AppColor.kBackground, borderRadius: BorderRadius.circular(12)),
          child: Text(
            "Today",
            textAlign: TextAlign.center,
            style: Style.primaryStyle.copyWith(
              fontWeight: FontWeight.w600,
            ),
          )),
    );
  }
}
