import 'package:flutter/material.dart';
import 'quiz_brain.dart';


void main() => runApp(Quizzler());


class Quizzler extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 130),
        appBar: AppBar(
          title: const Text('Quizzler'),
          backgroundColor: Color.fromARGB(255, 0, 0, 120),
        ),
        body: QuizPage(),
      ),
    );
  }
}


class QuizPage extends StatefulWidget {
  @override 
  _QuizPageState createState() => _QuizPageState();
}


QuizBrain quizBrain = QuizBrain();

class _QuizPageState extends State<QuizPage> {

  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      if(!quizBrain.isFinished()) {
        if(userPickedAnswer == correctAnswer) {
          scoreKeeper.add(const Icon(Icons.check, color: Colors.green,));
        } else {
          scoreKeeper.add(const Icon(Icons.close, color: Colors.red,));
        }
        quizBrain.nextQuestion();

      } else {
        quizBrain.reset();
        scoreKeeper = [];
      }
    });
  }  // checkAnswer

  @override 
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ), 
          )
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  checkAnswer(true);
                });
              },
            ),
          )
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.red,
              child: const Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  checkAnswer(false);
                });
              }
            ),
          )
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}


