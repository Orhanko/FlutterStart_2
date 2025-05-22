import 'package:flutter/material.dart';

class StartingScreen extends StatelessWidget {
  const StartingScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
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
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/images/quiz-logo.png",
              width: 200,
              color: const Color.fromARGB(141, 255, 255, 255),
            ),
            SizedBox(height: 80),
            Text(
              "Let's take a Flutter quiz!",
              style: TextStyle(
                fontSize: 20,
                color: const Color.fromARGB(255, 253, 255, 241),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: startQuiz,
              icon: Icon(size: 30, Icons.rocket_launch, color: Colors.black),
              label: Text("Start Quiz"),
            ),
          ],
        ),
      ),
    );
  }
}
