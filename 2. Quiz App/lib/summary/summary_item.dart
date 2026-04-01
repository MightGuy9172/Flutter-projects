import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/summary/summary_number.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.summary, {super.key});

  final Map<String, Object> summary;

  @override
  Widget build(context) {
    final isCorrectAnswer = summary['choosen'] == summary['correct'];
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 0,
      ),
      child: Row(
        children: [
          SummaryNumber(
            isCorrectAnswer: isCorrectAnswer,
            questionIndex: summary['question_idx'] as int,
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  summary['question'] as String,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  summary['choosen'] as String,
                  style: const TextStyle(
                    color: Color(0xFFB9A7F7),
                  ),
                ),
                Text(
                  summary['correct'] as String,
                  style: const TextStyle(
                    color: Color(0xFF7CF2E5),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
