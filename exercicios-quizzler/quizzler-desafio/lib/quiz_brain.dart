import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question('Some cats are actually allergic to humans.', 1),
    Question('You can lead a cow down stairs but not up stairs.', 3),
    Question('The universe is infinite.', 2),
    Question('Tea contains more caffeine than coffee and soda.', 3),
    Question('Approximately one quarter of human bones are in the feet.', 1),
    Question('Mice have more bones than humans.', 1),
    Question('The capital of Australia is Sydney.', 3),
    Question('There is life outside the Earth.', 2),
    Question('Bing by Microsoft is the most popular search engine on the Internet.', 3),
    Question('The first song ever sung in the space was “Happy Birthday.”', 1),
    
    Question('Press any key to restart', 0),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber ++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  int getCorrectAnswer() {
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

  // ....
  int getQuantQuestions() {
    return _questionBank.length - 1;
  }
  
}