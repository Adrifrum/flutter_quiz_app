import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 10) {
      resultText = 'Je ne reconnais pas ma Manou !';
    } else if (resultScore <= 15) {
      resultText = 'C\'est pas la grande forme Manou!';
    } else if (resultScore <= 25) {
      resultText = 'Je te reconnais bien là';
    } else {
      resultText = '100% Manou !';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        FlatButton(
          child: Text('Restart Quiz!'),
          textColor: Colors.blue,
          onPressed: resetHandler,
        ),
      ],
    ));
  }
}
