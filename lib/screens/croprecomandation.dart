import 'package:flutter/material.dart';

Widget reocmmandation() {
  return const CropsRecommendationScreen();
}

class CropsRecommendationScreen extends StatelessWidget {
  const CropsRecommendationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Crops Recommendation")),
      body: const Center(child: Text("Recommend crops based on soil, season, etc.")),
    );
  }
}
