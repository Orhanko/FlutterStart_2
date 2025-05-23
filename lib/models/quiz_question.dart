class QuizQuestion {
  const QuizQuestion(this.questionTitle, this.answers);

  final String questionTitle;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
