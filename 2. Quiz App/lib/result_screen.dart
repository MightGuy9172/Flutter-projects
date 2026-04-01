import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/summary/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.choosenAnswers,
    required this.onRestart,
  });

  final List<String> choosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> get summaryData {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question_idx': i,
        'question': questions[i].text,
        'choosen': choosenAnswers[i],
        'correct': questions[i].answers[0],
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final correctAns = summaryData
        .where((data) => data['choosen'] == data['correct'])
        .length;
    final total = questions.length;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "You answered $correctAns out of $total answers correct !",
          style: GoogleFonts.oswald(fontSize: 22, color: Colors.white),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 30,
        ),
        QuestionSummary(summaryData),
        const SizedBox(
          height: 30,
        ),
        TextButton.icon(
          onPressed: onRestart,
          icon: Icon(
            Icons.restart_alt,
            color: Colors.white,
          ),
          label: Text(
            "Restart Quiz",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
