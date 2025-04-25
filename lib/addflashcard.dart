import 'package:flutter/material.dart';

import 'flashcard.dart';

class AddFlashcardScreen extends StatefulWidget {
  final Function(Flashcard) addFlashcard;

  AddFlashcardScreen({required this.addFlashcard});

  @override
  _AddFlashcardScreenState createState() => _AddFlashcardScreenState();
}

class _AddFlashcardScreenState extends State<AddFlashcardScreen> {
  final _questionController = TextEditingController();
  final _answerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Flashcard'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _questionController,
              decoration: InputDecoration(labelText: 'Question'),
            ),
            TextField(
              controller: _answerController,
              decoration: InputDecoration(
                labelText: 'Answer',
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_questionController.text == "" ||
                        _answerController.text == "") {
                    } else {
                      final flashcard = Flashcard(
                        question: _questionController.text,
                        answer: _answerController.text,
                      );
                      widget.addFlashcard(flashcard);
                      setState(() {
                        _questionController.text = "";
                        _answerController.text = "";
                      });
                    }
                  },
                  child: Text('Next'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_questionController.text == "" ||
                        _answerController.text == "") {
                    } else {
                      final flashcard = Flashcard(
                        question: _questionController.text,
                        answer: _answerController.text,
                      );
                      widget.addFlashcard(flashcard);
                      setState(() {
                        _questionController.text = "";
                        _answerController.text = "";
                      });
                    }
                    Navigator.pop(context);
                  },
                  child: Text('Add Flashcard'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
