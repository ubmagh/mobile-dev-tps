import 'Question.dart';

class Questionnaire {
  String title;
  List<Question> questions;

  Questionnaire(this.title, this.questions);

  @override
  String toString() {
    String ret = "";

    ret += '\n### Questionnaire :  $title  ###\nQuestions liste : \n';

    if (questions.length == 0)
      ret += " \t there are no questions in this questionnaire ! ";

    int count = 1;
    questions.forEach((element) {
      ret += "\n  " + element.toString(index: (count++).toString());
    });

    return ret;
  }
}
