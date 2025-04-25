import 'dart:math';

import 'package:flutter/material.dart';

import 'flashcard.dart';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  final List<Flashcard> flashcards;

  QuizScreen({required this.flashcards});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;
  final TextEditingController _answerController = TextEditingController();
  List<bool> _correctAnswers = [];
  List<String> _userAnswers = [];


  @override
  void dispose() {
    _answerController.dispose();
    super.dispose();
  }

  void _checkAnswer() {
    final userAnswer = _answerController.text.trim().toLowerCase();
    final correctAnswer = widget.flashcards[_currentIndex].answer.trim().toLowerCase();

    setState(() {
      _userAnswers.add(_answerController.text);  // Store the user's answer
      if (userAnswer == correctAnswer) {
        _correctAnswers.add(true);
      } else {
        _correctAnswers.add(false);
      }

      _answerController.clear();  // Clear the text field for the next question
      _currentIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_currentIndex >= widget.flashcards.length) {
      int correct = _correctAnswers.where((answer) => answer == true).length;
      int incorrect = _correctAnswers.length - correct;

      return Scaffold(
        appBar: AppBar(title: Text('Quiz Results:'),backgroundColor: Colors.blue,),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                'Quiz Completed!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Correct Answers: $correct',
                style: TextStyle(fontSize: 20, color: Colors.green),
              ),
              Text(
                'Incorrect Answers: $incorrect',
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.flashcards.length,
                  itemBuilder: (context, index) {
                    final flashcard = widget.flashcards[index];
                    final userAnswer = _userAnswers[index];
                    final isCorrect = _correctAnswers[index];

                    return Card(
                      color: isCorrect ? Colors.green[100] : Colors.red[100],
                      child: ListTile(
                        title: Text("Question:" + flashcard.question),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Your Answer: $userAnswer'),
                            Text('Correct Answer: ${flashcard.answer}'),
                            Text(
                              isCorrect ? 'Correct!' : 'Incorrect',
                              style: TextStyle(
                                  color: isCorrect ? Colors.green : Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Return to Home'),
              ),
            ],
          ),
        ),
      );
    }

    final flashcard = widget.flashcards[_currentIndex];
    var random = Random();
    return Scaffold(
      appBar: AppBar(title: Text('Quiz'),backgroundColor: Colors.blue,),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                flashcard.question,
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(height: 20),
              Container(
                width: 200,
                child: TextField(
                  controller: _answerController,
                  decoration: InputDecoration(labelText: 'Enter your answer'),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_answerController.text.isNotEmpty) {
                    _checkAnswer();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please enter an answer.')),
                    );
                  }
                },
                child: Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


