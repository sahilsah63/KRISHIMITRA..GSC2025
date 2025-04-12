import 'package:flutter/material.dart';

Widget learnings() {
  return const LearningTutorialsScreen();
}

class LearningTutorialsScreen extends StatelessWidget {
  const LearningTutorialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Learning Tutorials")),
      body: const Center(child: Text("Agriculture training videos & tutorials")),
    );
  }
}
