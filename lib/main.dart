import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'red', 'score': 7},
        {'text': 'black', 'score': 10},
        {'text': 'blue', 'score': 4},
        {'text': 'white', 'score': 2},
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Snake', 'score': 10},
        {'text': 'Rabbit', 'score': 5},
        {'text': 'Elephant', 'score': 2},
        {'text': 'Lion', 'score': 5},
      ]
    },
    {
      'questionText': 'What\'s your favorite place?',
      'answers': [
        {'text': 'surat', 'score': 5},
        {'text': 'mumbai', 'score': 4},
        {'text': 'simla', 'score': 2},
        {'text': 'sri lanka', 'score': 7},
      ]
    }
  ];


  void _answerQuestion(int score) {
    if (_questionIndex < questions.length) {
      print('We have more questions');
    }
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < questions.length
            ? Quiz(
                questions: questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex)
            : Result(_totalScore),
      ),
    );
  }
}
