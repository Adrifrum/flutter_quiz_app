import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

//void main() {
//  runApp(MyApp());
//}

void main() => runApp(MyApp());

// extends = this class will be baes on other class (provided by flutter)
// Vraiable inside class = properties and function inside class = methods
//Scaffold = basic design

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Qu\'est ce que Manou aime manger ?',
      'answers': [
        {'text': 'Du riz aux lentilles avec des poulets KFC', 'score': 5},
        {'text': 'Des poissons panés avec des courgettes', 'score': 5},
        {'text': 'Des pates aux boulettes', 'score': 10},
        {'text': 'Une salade de concombre/mais/betterave', 'score': 1}
      ],
    },
    {
      'questionText': 'Quelle thé Manou aime boire ?',
      'answers': [
        {'text': 'Thé Vert', 'score': 5},
        {'text': 'Thé Rouge', 'score': 1},
        {'text': 'Thé Noir', 'score': 1},
        {'text': 'Thé à la Vanille', 'score': 10}
      ],
    },
    {
      'questionText': 'Ou sera notre prochain voyage ?',
      'answers': [
        {'text': 'Tunis', 'score': 1},
        {'text': 'Porto', 'score': 5},
        {'text': 'Bora Bora', 'score': 8},
        {'text': 'San Fransisco', 'score': 10}
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;


  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
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

  @override //decoration : meaning that we are overwrigting the class that we are extending
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ALLO RESTO MANOU'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
