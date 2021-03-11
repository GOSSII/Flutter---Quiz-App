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
  final questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': ['red', 'black', 'blue', 'white']
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': ['Snake', 'Rabbit', 'Elephant', 'Lion']
    },
    {
      'questionText': 'What\'s your favorite place?',
      'answers': ['surat', 'mumbai', 'simla', 'sri lanka']
    }
  ];

  void _answerQuestion() {
    if (_questionIndex < questions.length) {
      print('We have more questions');
    }
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
            : Result(),
      ),
    );
  }
}
