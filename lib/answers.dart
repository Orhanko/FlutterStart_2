import 'package:flutter/material.dart';
import 'package:pocetak2/answers_summary.dart';
import 'package:pocetak2/data/questions.dart';

class Answers extends StatelessWidget {
  final void Function() restartQuiz;
  final List<String> correctAnswersArray;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < correctAnswersArray.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].questionTitle,
        'correct_answer': questions[i].answers[0],
        'chosen_answer': correctAnswersArray[i],
      });
    }
    return summary;
  }

  const Answers(
    this.restartQuiz, {
    super.key,
    required this.correctAnswersArray,
  });
  @override
  Widget build(BuildContext context) {
    final data = getSummaryData();
    final totalQuestion = questions.length;
    final correctAnswers =
        data.where((data) {
          return data['chosen_answer'] == data['correct_answer'];
        }).length;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.amber, Colors.greenAccent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'You answered $correctAnswers out of $totalQuestion questions correctly!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color.fromARGB(255, 103, 99, 99),
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(height: 40),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: AnswersSummary(getSummaryData()),
            ),
            SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: restartQuiz,
              icon: Icon(size: 25, Icons.refresh),
              label: Text("Restart quiz"),
            ),
          ],
        ),
      ),
    );
  }
}
