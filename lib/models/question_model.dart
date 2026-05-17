class Question {
  final String difficulty;
  final String question;
  final List<String> options;
  final String correctAnswer;

  Question({
    required this.difficulty,
    required this.question,
    required this.options,
    required this.correctAnswer,
  });
}
