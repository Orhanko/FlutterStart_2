import 'package:flutter/material.dart';
import 'package:pocetak2/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.selectAnswer});
  final void Function(String answer) selectAnswer;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionsScreen> {
  var currentQuestionScreen = 0;

  void answerQuestion(String answer) {
    widget.selectAnswer(answer);
    setState(() {
      currentQuestionScreen++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionScreen];
    return SizedBox(
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.amber, Colors.greenAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Container(
          margin: EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                currentQuestion.questionTitle,
                style: TextStyle(
                  color: const Color.fromARGB(255, 103, 99, 99),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              ...currentQuestion.getShuffledAnswers().map((nesto) {
                return ElevatedButton(
                  onPressed: () {
                    answerQuestion(nesto);
                  },
                  child: Text(nesto),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
