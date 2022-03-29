import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question('Some cats are actually allergic to humans.', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber ++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      return true;
    } 
    return false;
  }

  void reset() {
    _questionNumber = 0;
  }
  
}