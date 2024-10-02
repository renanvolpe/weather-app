import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/style/app_color.dart';
import '../../../core/style/text_style.dart';

class OffLineWeatherPage extends StatelessWidget {
  const OffLineWeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kWhite,
        leading: IconButton(onPressed: () => Modular.to.pop(), icon: const Icon(Icons.chevron_left)),
      ),
      backgroundColor: AppColor.kWhite,
      body: SafeArea(
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Text("Let's See Offline Saved Weather",
                    style: Style.darkStyle.copyWith(fontSize: 62, fontWeight: FontWeight.bold)),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                  onTap: () => Modular.to.pushNamed('./off-weather'),
                  child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 35),
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 55),
                      decoration: BoxDecoration(color: AppColor.kgrey2, borderRadius: BorderRadius.circular(60)),
                      child: Text(
                        "Let's see these weather",
                        style: Style.defaultLightStyle.copyWith(fontSize: 20),
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}
