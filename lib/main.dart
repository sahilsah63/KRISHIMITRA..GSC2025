import 'package:flutter/material.dart';
import 'screens/home_screen.dart'; // Make sure this path matches your file structure

void main() {
  runApp(const SmartKrishiApp());
}

class SmartKrishiApp extends StatelessWidget {
  const SmartKrishiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Krishi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
      ),
      home:  HomePage(),
    );
  }
}
