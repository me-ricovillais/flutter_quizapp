import 'package:flutter/material.dart';
import 'package:quizapp/start_screen.dart';

void main() {
  runApp(const QuizApp());
}

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 3, 36, 146),
              Color.fromARGB(255, 9, 34, 114),
              Color.fromARGB(255, 11, 30, 94),
            ], begin: startAlignment, end: endAlignment),
          ),
          child: const StartScreen(),
        ),
      ),
    );
  }
}
