import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/style/app_color.dart';
import '../../../core/style/text_style.dart';
import '../../../shared/internet/bloc/network_bloc.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late NetworkBloc networkBloc;
  @override
  void initState() {
    networkBloc = Modular.get<NetworkBloc>();
    networkBloc.add(NetworkListenedStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NetworkBloc, NetworkState>(
      bloc: Modular.get<NetworkBloc>(),
      listener: (context, state) async {
        if (state is NetworkConnected) {
          print("Is Connected");
        }
        if (state is NetworkNotConnected) {
          await showDialog(
              context: context,
              builder: (_) => const AlertDialog(
                    title: Text("not internet"),
                  ));
        }
      },
      child: Scaffold(
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
                      style: Style.darkStyle.copyWith(fontSize: 70, fontWeight: FontWeight.bold)),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                    onTap: () => Modular.to.pushNamed('./weather'),
                    child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 35),
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 55),
                        decoration: BoxDecoration(color: AppColor.kgrey2, borderRadius: BorderRadius.circular(60)),
                        child: Text(
                          "Let's see the app",
                          style: Style.defaultLightStyle.copyWith(fontSize: 20),
                        ))),
              ),
            ],
          ),
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
