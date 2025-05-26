import 'package:flutter/material.dart';

class AnswersSummary extends StatelessWidget {
  const AnswersSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;
  Color bojica(String prvi, String drugi) {
    if (prvi == drugi) {
      return const Color.fromARGB(255, 174, 237, 176);
    } else {
      return const Color.fromARGB(255, 244, 144, 137);
    }
  }

  @override
  Widget build(context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:
              summaryData.map((data) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: bojica(
                          (data['correct_answer']).toString(),
                          (data['chosen_answer']).toString(),
                        ),

                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(width: 0.7),
                      ),
                      child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            (data['question']).toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: const Color.fromARGB(255, 103, 99, 99),
                            ),
                          ),
                          Text(
                            "Chosen answer:${data['chosen_answer']}",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Correct answer: ${data['correct_answer']}",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }).toList(),
        ),
      ),
    );
  }
}
