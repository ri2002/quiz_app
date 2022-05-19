import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

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
  void _resetQuiz(){
      setState(() {
        _questionIndex =0;
        _totalScore = 0;
      });
    }
  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    final _questions = const [
      {
        'questionText': 'What\'s your favourite color?',
        'answers': [
          {'text': 'Black', 'score': 10},
          {'text': 'Red', 'score': 5},
          {'text': 'Blue', 'score': 3},
          {'text': 'White', 'score': 1},
        ],
      },
      {
        'questionText': 'What\'s your favourite animal?',
        'answers': [
          {'text': 'Sheep', 'score': 10},
          {'text': 'Cat', 'score': 5},
          {'text': 'Elephant', 'score': 3},
          {'text': 'Dog', 'score': 1},
        ],
      },
      {
        'questionText': 'What\'s your favourite instructor?',
        'answers': [
          {'text': 'Max', 'score': 10},
          {'text': 'Manu', 'score': 5},
          {'text': 'Ross', 'score': 3},
          {'text': 'Joey', 'score': 1},
        ],
      },
    ];


    

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
