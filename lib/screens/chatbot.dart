import 'package:flutter/material.dart';

Widget bot() {
  return const ChatBotScreen();
}

class ChatBotScreen extends StatelessWidget {
  const ChatBotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ChatBot")),
      body: const Center(child: Text("Ask questions from the agriculture assistant bot")),
    );
  }
}
