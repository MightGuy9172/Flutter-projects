import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.changeScreen, {super.key});

  final void Function() changeScreen;
  @override
  Widget build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
          color: const Color.fromARGB(150, 255, 255, 255),
        ),
        SizedBox(
          height: 50,
        ),
        Text(
          "Welcome to the Quiz !",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        SizedBox(
          height: 50,
        ),
        OutlinedButton.icon(
          onPressed: changeScreen,
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: Color.fromARGB(255, 255, 255, 255),
              width: 1.5,
            ),
            foregroundColor: Color.fromARGB(255, 255, 255, 255),
          ),
          icon: Icon(Icons.arrow_right_alt),
          label: Text("Start Quiz"),
        ),
      ],
    );
  }
}
