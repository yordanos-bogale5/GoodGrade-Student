import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InstAddQuiz extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const InstAddQuiz({Key? key});

  @override
  // ignore: library_private_types_in_public_api
  _InstAddQuizState createState() => _InstAddQuizState();
}

class _InstAddQuizState extends State<InstAddQuiz> {
  List<Map<String, dynamic>> quizzes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Creation'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              // Open a dialog to add a new course
              _showAddQuizDialog(context);
            },
            child: const Text('Add Quiz'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: quizzes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Quiz ${index + 1}'),
                  subtitle: Text(
                    'Quiz Id: ${quizzes[index]['Quiz Id']} | '
                    'Quiz Name: ${quizzes[index]['Quiz Name']} | '
                    'Course Id: ${quizzes[index]['Course Id']} |  '
                    'Course Name: ${quizzes[index]['Course Name']} |  '
                    'Quiz Description: ${quizzes[index]['Quiz Description']} | '
                    'Mark %: ${quizzes[index]['Mark %']} | '
                    'Quiz Type: ${quizzes[index]['Quiz Type']}',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showAddQuizDialog(BuildContext context) {
    String quizId = '';
    String quizName = '';
    String courseId = '';
    String courseName = '';
    String quizDescription = '';
    String mark = '';
    String quizType = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Quiz'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(labelText: 'Quiz Id'),
                  onChanged: (value) {
                    quizId = value;
                  },
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Quiz Name'),
                  onChanged: (value) {
                    quizName = value;
                  },
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Course Id'),
                  onChanged: (value) {
                    courseId = value;
                  },
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Course Name'),
                  onChanged: (value) {
                    courseName = value;
                  },
                ),
                TextField(
                  decoration:
                      const InputDecoration(labelText: 'Quiz Description'),
                  onChanged: (value) {
                    quizDescription = value;
                  },
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Mark %'),
                  onChanged: (value) {
                    mark = value;
                  },
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Quiz Type'),
                  onChanged: (value) {
                    quizType = value;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Add the quiz to the list
                setState(() {
                  quizzes.add({
                    'Quiz Id': quizId,
                    'Quiz Name': quizName,
                    'Course Id': courseId,
                    'Course Name': courseName,
                    'Quiz Description': quizDescription,
                    'Mark %': mark,
                    'Quiz Type': quizType,
                  });
                });

                // Send data to the server
                final url = Uri.https(
                  'my-creavers-project-9ae09-default-rtdb.firebaseio.com',
                  'Add-Quiz.json',
                );
                http.post(
                  url,
                  headers: {
                    'Content-Type': 'application/json',
                  },
                  body: json.encode({
                    'Quiz Id': quizId,
                    'Quiz Name': quizName,
                    'Course Id': courseId,
                    'Course Name': courseName,
                    'Quiz Description': quizDescription,
                    'Mark %': mark,
                    'Quiz Type': quizType,
                  }),
                );

                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
