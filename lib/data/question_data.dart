import '../models/question_model.dart';

List<Question> questions = [
  Question(
    difficulty: 'Easy',
    question: 'What is Flutter?',
    options: ['Programming Language', 'SDK', 'Database', 'Operating System'],
    correctAnswer: 'SDK',
  ),

  Question(
    difficulty: 'Easy',
    question: 'Which language is used in Flutter?',
    options: ['Java', 'Python', 'Dart', 'C++'],
    correctAnswer: 'Dart',
  ),

  Question(
    difficulty: 'Medium',
    question: 'What is StatefulWidget?',
    options: [
      'Static Widget',
      'Widget with mutable state',
      'Database Widget',
      'Animation Widget',
    ],
    correctAnswer: 'Widget with mutable state',
  ),

  Question(
    difficulty: 'Hard',
    question: 'What is widget lifecycle?',
    options: [
      'Widget animation',
      'Stages of widget existence',
      'Database process',
      'Compiler process',
    ],
    correctAnswer: 'Stages of widget existence',
  ),
];
