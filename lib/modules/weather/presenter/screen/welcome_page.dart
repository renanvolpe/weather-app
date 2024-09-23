import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/style/app_color.dart';
import '../../../core/style/text_style.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhite,
      body: SafeArea(
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text("Develop by Renan Volpe", style: Style.defaultStyle.copyWith(fontSize: 14)),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Text("Let's See The Weather Arround you",
                    style: Style.primaryStyle.copyWith(fontSize: 70, fontWeight: FontWeight.bold)),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                  onTap: () => Modular.to.pushNamed('./weather'),
                  child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 35),
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 55),
                      decoration: BoxDecoration(color: AppColor.kPrimary, borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        "Let's see the app",
                        style: Style.whiteStyle.copyWith(fontSize: 20),
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}

Widget develop = Align(
  alignment: Alignment.topCenter,
  child: ListTile(
    title: Text(
      "It was develop by me, Renan Volpe",
      style: Style.primaryStyle,
    ),
    subtitle: Text(
      "I'm FLutter Dev, i hope you like the app :)",
      style: Style.primaryStyle.copyWith(fontSize: 14),
    ),
    trailing: ClipOval(
      child: Image.asset("assets/photo.jpg"),
    ),
  ),
);
