import 'question.dart';

class QuestionList {
  int _questionIndex=0;
  List <Question> _questionList =[
    Question(
      questionText: 'The atomic number for lithium is 17', questionAnswer:false,
    ),
    Question(
      questionText: 'The river Seine in Paris is longer than the river Thames in London', questionAnswer:true,
    ),
    Question(
      questionText: 'An octopus has three hearts', questionAnswer:true,
    ),
    Question(
      questionText: 'In the English language there is no word that rhymes with orange', questionAnswer:true,
    ),
    Question(
      questionText: 'There are 14 bones in a human foot', questionAnswer:false,
    ),
    Question(
      questionText: 'Venus is the hottest planet in the solar system', questionAnswer:true,
    ),
  ];

  String getQuestionText(){
    return _questionList[_questionIndex].questionText;
  }

  bool getQuestionAnswer(){
    return _questionList[_questionIndex].questionAnswer;
  }

  void nextQuestion(){
    if(_questionIndex<_questionList.length){
    _questionIndex++;
    }
  }

  bool lastQuestion(){
    if(_questionIndex +1 >= _questionList.length){
      return true;
    }else{
      return false;
    }
  }

  void resetList(){
    _questionIndex = 0;
  }




}