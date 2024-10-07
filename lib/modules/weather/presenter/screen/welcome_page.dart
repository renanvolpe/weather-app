import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';

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
          await showDialogNoInternet(context);
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
                  child: Text("Develop by Renan Volpe", style: Style.defaultStyle.copyWith(fontSize: 12)),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                          onTap: () => Modular.to.pushNamed("/offline/"),
                          child: Text("Offline app", style: Style.defaultStyle.copyWith(fontSize: 14))),
                      const Icon(Icons.chevron_right)
                    ],
                  ),
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

  Future<dynamic> showDialogNoInternet(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: Modular.get<NetworkBloc>().state is NetworkConnected,
        builder: (_) => AlertDialog(
              title: Text("There is no internet connection", style: Style.darkStyle.copyWith(fontSize: 22)),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Connect to internet or go to offline module", style: Style.darkStyle.copyWith(fontSize: 14)),
                  const Gap(20),
                  Row(
                    children: [
                      TextButton(
                          onPressed: () => Modular.to.pushNamed("/offline/"),
                          child: Text("Offline module", style: Style.darkStyle.copyWith(fontSize: 14))),
                      const Spacer(),
                      TextButton(
                          onPressed: () {
                            if (Modular.get<NetworkBloc>().state is NetworkConnected) {
                              Modular.to.pop();
                            } else {
                              var snackBar = SnackBar(
                                backgroundColor: AppColor.kBlack,
                                content: Text('Internet not connected yet, try again later', style: Style.whiteStyle),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }
                          },
                          child: Text("Try again", style: Style.darkStyle.copyWith(fontSize: 14))),
                    ],
                  ),
                ],
              ),
            ));
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
