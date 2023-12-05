// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'add_answer.dart';
import 'add_assignment.dart';
import 'add_cours.dart';
import 'add_quiz.dart';



void main() {
  runApp(const InstDashboard());
}

class InstDashboard extends StatelessWidget {
  const InstDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: () async {
          // Handle back button press
          print('Back button pressed');
          return true; // Return true to allow back navigation
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Instructor DashBoard'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                // Handle back button press
                print('Back button pressed');
                Navigator.pop(context); // Navigate back
              },
            ),
          ),
          body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 7.0,
              mainAxisSpacing: 0.0,
            ),
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              List<String> texts = [
                'Add Courses ',
                'Add Quiz',
                'Add Quiz Answer',
                'Add Assignment',
              ];

              return InkWell(
                onTap: () {

                  print('Tapped on card ${index + 1}');

                  switch (index) {
                    case 0:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const InstAddCourse(),
                        ),
                      );
                      break;
                    case 1:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const InstAddQuiz(),
                        ),
                      );
                      break;
                      case 2:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  QuizAnswerUploader(),
                        ),
                      );
                      break;
                      case 3:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const InstAddAssignment(),
                        ),
                      );
                      break;


                    // Add cases for other cards
                    default:
                      break;
                  }
                },
                child: Card(
                  elevation: 4.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        texts[index],
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}