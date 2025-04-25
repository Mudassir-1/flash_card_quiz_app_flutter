import 'package:flutter/material.dart';

import 'flashcard.dart';

class FlashcardListScreen extends StatelessWidget {
  final List<Flashcard> flashcards;

  FlashcardListScreen({required this.flashcards});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flashcards'),backgroundColor: Colors.blue,),
      body: ListView.builder(
        itemCount: flashcards.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("$index )"),
            subtitle:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Question : " + flashcards[index].question),
                Text("Answer : " +flashcards[index].answer),
              ],
            ),

          );
        },
      ),
    );
  }
}
