import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';

import 'package:quizapp/start_screen.dart';
import 'package:quizapp/questions_screen.dart';
import 'package:quizapp/results_screen.dart';

// variable
const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void restartQuiz() {
    setState(() {
      activeScreen = 'start-screen';
      selectedAnswers = [];
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget widgetScreen = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      widgetScreen = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    } else if (activeScreen == 'results-screen') {
      widgetScreen = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestartQuiz: restartQuiz,
      );
    }

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
          child: widgetScreen,
        ),
      ),
    );
  }
}
