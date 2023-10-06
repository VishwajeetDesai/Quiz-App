class QuizQuestion {

  const QuizQuestion(this.text,this.answers);

final String text;
final List<String> answers;

List<String>getShuffledAnswers(){
  final shffledList=List.of(answers);
  shffledList.shuffle();
  return shffledList;
}

}