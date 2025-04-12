import 'package:flutter/material.dart';

Widget rentools() {
  return const ToolsRentScreen();
}

class ToolsRentScreen extends StatelessWidget {
  const ToolsRentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tools Rent")),
      body: const Center(child: Text("List of farming tools for rent")),
    );
  }
}
