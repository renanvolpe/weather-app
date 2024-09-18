import 'package:flutter/material.dart';

import '../../../core/style/app_color.dart';
import '../../../core/style/text_style.dart';

class BtnDayDefault extends StatelessWidget {
  const BtnDayDefault({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 7),
          decoration: BoxDecoration(color: AppColor.kWhite, borderRadius: BorderRadius.circular(12)),
          child: Text(
            "Tomorrow",
            textAlign: TextAlign.center,
            style: Style.defaultStyle.copyWith(
              fontWeight: FontWeight.w600,
            ),
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
