import 'package:flutter/material.dart';
import 'package:dice_roll/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Home(),
      ),
    );
  }
}
