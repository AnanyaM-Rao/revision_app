import 'package:flutter/material.dart';
import '../data/question_data.dart';
import '../models/question_model.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  final String difficulty;

  const QuizScreen({super.key, required this.difficulty});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;

  int score = 0;

  String? selectedAnswer;

  late List<Question> filteredQuestions;

  @override
  void initState() {
    super.initState();

    filteredQuestions = questions.where((question) {
      return question.difficulty == widget.difficulty;
    }).toList();
  }

  void nextQuestion() {
    if (selectedAnswer ==
        filteredQuestions[currentQuestionIndex].correctAnswer) {
      score++;
    }

    if (currentQuestionIndex < filteredQuestions.length - 1) {
      setState(() {
        currentQuestionIndex++;

        selectedAnswer = null;
      });
    } else {
      Navigator.pushReplacement(
        context,

        MaterialPageRoute(
          builder: (context) => ResultScreen(
            score: score,
            totalQuestions: filteredQuestions.length,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = filteredQuestions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(title: Text('${widget.difficulty} Quiz')),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              'Question ${currentQuestionIndex + 1}/${filteredQuestions.length}',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            Card(
              elevation: 4,

              child: Padding(
                padding: const EdgeInsets.all(20),

                child: Text(
                  currentQuestion.question,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ),

            const SizedBox(height: 20),

            ...currentQuestion.options.map((option) {
              return RadioListTile<String>(
                title: Text(option),

                value: option,

                groupValue: selectedAnswer,

                onChanged: (value) {
                  setState(() {
                    selectedAnswer = value;
                  });
                },
              );
            }).toList(),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 50,

              child: ElevatedButton(
                onPressed: selectedAnswer == null ? null : nextQuestion,

                child: Text(
                  currentQuestionIndex == filteredQuestions.length - 1
                      ? 'Finish Quiz'
                      : 'Next Question',

                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
