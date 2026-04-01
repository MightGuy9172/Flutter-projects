import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/question_screen.dart';
import 'package:quiz/result_screen.dart';
import 'package:quiz/start_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() {
    return _MyAppAState();
  }
}

class _MyAppAState extends State<MyApp> {
  var currentScreen = 'start';
  List<String> choosenAnswers = [];

  void switchScreen() {
    setState(() {
      currentScreen = 'question';
    });
  }

  void onSelection(String answer) {
    choosenAnswers.add(answer);
    if (choosenAnswers.length == questions.length) {
      setState(() {
        currentScreen = 'result';
      });
    }
  }

  void restartQuiz() {
    choosenAnswers = [];
    setState(() {
      currentScreen = 'question';
    });
  }

  @override
  Widget build(context) {
    Widget screen = StartScreen(switchScreen);
    if (currentScreen == 'question') {
      screen = QuestionScreen(
        onSelectedAnswer: onSelection,
      );
    }
    if (currentScreen == 'result') {
      screen = ResultScreen(
        choosenAnswers: choosenAnswers,
        onRestart: restartQuiz,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 4, 51, 83),
                Color.fromARGB(255, 9, 132, 214),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(child: screen),
        ),
      ),
    );
  }
}
