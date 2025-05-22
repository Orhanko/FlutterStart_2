import 'package:flutter/material.dart';
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
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = StartingScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen();
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(home: Scaffold(body: activeScreen));
  }
}
