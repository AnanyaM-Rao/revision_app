import 'package:flutter/material.dart';
import 'quiz_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedDifficulty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz App')),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text(
              'Select Difficulty',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            RadioListTile<String>(
              title: const Text('Easy'),
              value: 'Easy',
              groupValue: selectedDifficulty,
              onChanged: (value) {
                setState(() {
                  selectedDifficulty = value;
                });
              },
            ),

            RadioListTile<String>(
              title: const Text('Medium'),
              value: 'Medium',
              groupValue: selectedDifficulty,
              onChanged: (value) {
                setState(() {
                  selectedDifficulty = value;
                });
              },
            ),

            RadioListTile<String>(
              title: const Text('Hard'),
              value: 'Hard',
              groupValue: selectedDifficulty,
              onChanged: (value) {
                setState(() {
                  selectedDifficulty = value;
                });
              },
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 50,

              child: ElevatedButton(
                onPressed: selectedDifficulty == null
                    ? null
                    : () {
                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (context) =>
                                QuizScreen(difficulty: selectedDifficulty!),
                          ),
                        );
                      },

                child: const Text('Start Quiz', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
