import 'package:flutter/material.dart';

Widget weather() {
  return const WeatherPredictionScreen();
}

class WeatherPredictionScreen extends StatelessWidget {
  const WeatherPredictionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Weather Prediction")),
      body: const Center(child: Text("Show weather forecast for farmers")),
    );
  }
}
