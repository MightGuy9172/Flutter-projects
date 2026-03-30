import 'package:flutter/material.dart';
import 'dart:math';

final randomizer = Random();

class Roller extends StatefulWidget {
  const Roller({super.key});

  @override
  State<Roller> createState() {
    return _RollerState();
  }
}

class _RollerState extends State<Roller> {
  var currentDice = 2;

  void rollDice() {
    setState(() {
      currentDice = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/dice-$currentDice.png',
          width: 200,
        ),
        SizedBox(
          height: 50,
        ),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            foregroundColor: Colors.amber,
            textStyle: TextStyle(
              fontSize: 28,
            ),
          ),
          child: Text("Roll Dice"),
        ),
      ],
    );
  }
}
