import 'package:flutter/material.dart';
import 'package:quiz/answer_button.dart';
import 'package:quiz/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({required this.onSelectedAnswer, super.key});
  final void Function(String answer) onSelectedAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentIdx = 0;

  void getNext(String answer) {
    widget.onSelectedAnswer(answer);
    setState(() {
      currentIdx++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentIdx];
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentQuestion.text,
            style: GoogleFonts.oswald(color: Colors.white, fontSize: 24),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 40,
          ),
          ...currentQuestion.getShuffled().map((ans) {
            return AnswerButton(
              text: ans,
              onTap: () {
                getNext(ans);
              },
            );
          }),
        ],
      ),
    );
  }
}
