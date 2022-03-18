import 'dart:convert';
import 'dart:io';
import 'Ansewer.dart';
import 'Question.dart';
import 'Questionnaire.dart';

void main() {
  String? input, description, anscor, anstitle;
  int qtsnum = 5, ansnum = 3, counter = 1, counter2 = 1, score;
  Question qst;
  List<Question> qstArr;
  Ansewer ans;
  List<Ansewer> ansArr;
  Questionnaire questionnaire;

  print(
      "#############################################################################################################################################");
  print("\n[Questionnaire]=========> Set questionnaire data :");
  do {
    print("\n[Questionnaire]-> enter questionnaire title : ");
    input = stdin.readLineSync(encoding: utf8)?.trim();
  } while (input == null || input.length == 0);

  do {
    print("\n[Questionnaire]-> enter number of questions (max: 5): ");
    qtsnum = int.parse(stdin.readLineSync(encoding: utf8) ?? "0");
  } while (qtsnum > 5 || qtsnum < 1);

  counter = 1;
  qstArr = [];
  while (counter <= qtsnum) {
    print('\n\t[Questionnaire]========> Set question number $counter : ');
    do {
      print('\n[Question$counter]-> Enter question n°$counter title: ');
      input = stdin.readLineSync(encoding: utf8);
    } while (input == null || input.length == 0);

    do {
      print(
          '\n[Question$counter]-> Enter question n°$counter\'s description: ');
      description = stdin.readLineSync(encoding: utf8);
    } while (description == null || description.length == 0);

    do {
      print(
          '\n[Question$counter]-> Enter question n°$counter\'s score (0<score<=10): ');
      score = int.parse(stdin.readLineSync(encoding: utf8) ?? "1");
    } while (score < 0 || score > 10);

    do {
      print(
          '\n[Question$counter]-> Enter question n°$counter\'s number of ansewers: ');
      ansnum = int.parse(stdin.readLineSync(encoding: utf8) ?? "0");
    } while (ansnum < 1 || ansnum > 3);
    ansArr = [];
    counter2 = 1;

    print(
        '\n[Question$counter]-----> Enter ansewers for the $counter th question.');
    while (counter2 <= ansnum) {
      do {
        print(
            '\n[Question$counter][Ansewer$counter2]-> Enter ansewer title for ansewer number $counter2 : ');
        anstitle = stdin.readLineSync(encoding: utf8);
      } while (anstitle == null || anstitle.length == 0);
      print(
          '\n[Question$counter][Ansewer$counter2]-> is the ansewer number $counter2 correct (0: no, else : yes) : ');
      anscor = stdin.readLineSync(encoding: utf8);
      ans = new Ansewer(anstitle, !(anscor!.trim() == "0"));
      ansArr.add(ans);
      counter2++;
    }

    qst = new Question(input, description, ansArr, score);
    qstArr.add(qst);
    counter++;
  }
  questionnaire = new Questionnaire(input!, qstArr);
  print(
      "#############################################################################################################################################");
  print("\n\n[Questionnaire]==> quetionnaire created successfully !");
  print(
      "###########################################################################################################################################################################################################################");

  print("\n\n ##==> Now try to ansewer this questionnaire : \n");
  score = 0;
  qstArr.forEach((element) {
    do {
      print(element);
      print(' Your answer (1 - ${element.ansewers.length})> ');
      counter = int.parse(stdin.readLineSync(encoding: utf8) ?? "0");
    } while (counter < 1 || counter > element.ansewers.length);
    if (element.ansewers[counter - 1].correct) score += element.score;
  });
  print("\n ##==> You got the score  : " + score.toString());

  print("\n\n ##==> Questionnaire correction : ");
  qstArr.forEach((element) {
    print("\nQ) Question : " + element.title + "?");
    ansArr = [];
    element.ansewers.forEach((ans) {
      if (ans.correct) ansArr.add(ans);
    });
    print("A) ==> correct ansewer is : ");
    if (ansArr.isEmpty) print(" # No correct ansewer ! :D");
    ansArr.forEach((element) {
      print(" -> " + element.title);
    });
  });

  print(
      "###########################################################################################################################################################################################################################");
print("EOF");
}
