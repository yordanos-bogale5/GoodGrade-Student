// ignore_for_file: avoid_print, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuizAnswerUploader extends StatefulWidget {
  @override
  _QuizAnswerUploaderState createState() => _QuizAnswerUploaderState();
}

class _QuizAnswerUploaderState extends State<QuizAnswerUploader> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _courseNameController = TextEditingController();
  final TextEditingController _quizNameController = TextEditingController();
  final TextEditingController _answerController = TextEditingController();

  void _uploadAnswer() async {
    String id = _idController.text;
    String courseName = _courseNameController.text;
    String quizName = _quizNameController.text;
    String answer = _answerController.text;

    if (id.isEmpty || courseName.isEmpty || quizName.isEmpty || answer.isEmpty) {
      // Handle validation or show an error message
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('quiz_answers').add({
        'id': id,
        'courseName': courseName,
        'quizName': quizName,
        'answer': answer,
        // Add other attributes as needed
      });

      // Quiz answer uploaded successfully
      print('Quiz answer uploaded successfully!');
      // You can add further UI feedback or navigation logic here
    } catch (error) {
      // Handle error
      print('Error uploading quiz answer: $error');
      // You can show an error message to the user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Answer Uploader'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _idController,
              decoration: const InputDecoration(labelText: 'ID'),
            ),
            TextField(
              controller: _courseNameController,
              decoration: const InputDecoration(labelText: 'Course Name'),
            ),
            TextField(
              controller: _quizNameController,
              decoration: const InputDecoration(labelText: 'Quiz Name'),
            ),
            TextField(
              controller: _answerController,
              decoration: const InputDecoration(labelText: 'Answer'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _uploadAnswer,
              child: const Text('Upload Answer'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: QuizAnswerUploader(),
  ));
}
