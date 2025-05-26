import 'package:flutter/material.dart';
import 'package:pocetak2/answers.dart';
import 'package:pocetak2/data/questions.dart';
import 'package:pocetak2/questions_screen.dart';
import 'package:pocetak2/starting_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = StartingScreen(switchScreen);
    super.initState();
  }

  void selectAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = Answers(
          correctAnswersArray: selectedAnswers,
          restartQuiz,
        );
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(selectAnswer: selectAnswer);
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = StartingScreen(switchScreen);
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(home: Scaffold(body: activeScreen));
  }
}
