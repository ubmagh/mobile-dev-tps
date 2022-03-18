import 'Ansewer.dart';

class Question {
  String title;
  String description;
  List<Ansewer> ansewers;
  int score = 0;

  Question(this.title, this.description, this.ansewers, this.score);

  @override
  String toString({String index = "Q"}) {
    String ret = '''$index) $title ?
      Ansewers : 
    ''';

    if (ansewers.length == 0) ret += "\t No ansewer provided ";
    int counter = 1;
    ansewers.forEach((element) {
      ret += "\t " + counter.toString() + element.toString() + "\n";
      counter++;
    });

    return ret;
  }
}
