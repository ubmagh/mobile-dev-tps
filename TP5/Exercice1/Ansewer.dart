class Ansewer {
  String title;
  bool correct = false;

  Ansewer(this.title, this.correct);

  String toString() {
    return '-> $title';
  }
}
