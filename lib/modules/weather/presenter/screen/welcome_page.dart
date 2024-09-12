import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WelcomePage"),
      ),
      body: TextButton(onPressed: () =>Modular.to.pushNamed('./weather'), child: const Center(child: Text("Let´s see the app"))),
    );
  }
}
