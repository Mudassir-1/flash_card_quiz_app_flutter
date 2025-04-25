import 'package:flutter/material.dart';
import 'FlashcardListScreen.dart';
import 'addflashcard.dart';
import 'flashcard.dart';
import 'quizscreen.dart';

void main() {
  runApp(FlashcardQuizApp());
}

class FlashcardQuizApp extends StatefulWidget {
  @override
  _FlashcardQuizAppState createState() => _FlashcardQuizAppState();
}

class _FlashcardQuizAppState extends State<FlashcardQuizApp> {
  List<Flashcard> _flashcards = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flashcard Quiz',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(flashcards: _flashcards),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Flashcard> flashcards;

  HomeScreen({required this.flashcards});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flashcard Quiz App'),backgroundColor: Colors.blue,),
      body:
      Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddFlashcardScreen(
                      addFlashcard: (flashcard) {
                        flashcards.add(flashcard);
                      },
                    ),
                  ),
                );
              },
              child: Text('Add Flashcard'),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FlashcardListScreen(flashcards: flashcards),
                  ),
                );
              },
              child: Text('View Flashcards'),
            ),
            SizedBox(height: 20,),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizScreen(flashcards: flashcards),
                  ),
                );
              },
              child: Text('Start Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}


