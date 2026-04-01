import 'package:flutter/material.dart';
import 'package:quiz/summary/summary_item.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 450,
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: summaryData.map((summary) {
              return SummaryItem(summary);
            }).toList(),
          ),
        ),
      ),
    );
  }
}
