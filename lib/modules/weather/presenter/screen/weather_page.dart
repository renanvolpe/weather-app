import 'package:flutter/material.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late TextEditingController weatherTextController;

  @override
  void initState() {
    weatherTextController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather here"),
      ),
      body: Column(
        children: [TextFieldWeather(weatherTextController: weatherTextController)],
      ),
    );
  }
}

class TextFieldWeather extends StatelessWidget {
  const TextFieldWeather({
    super.key,
    required this.weatherTextController,
  });

  final TextEditingController weatherTextController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: TextField(
        decoration: const InputDecoration(hintText: "Choose your city"),
        controller: weatherTextController,
        onChanged: (value){},
      ),
    );
  }
}
