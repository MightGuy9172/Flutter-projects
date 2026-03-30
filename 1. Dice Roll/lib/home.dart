import 'package:flutter/material.dart';
import 'package:dice_roll/roller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 90, 3, 106),
            Color.fromARGB(255, 145, 6, 170),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Roller(),
      ),
    );
  }
}
