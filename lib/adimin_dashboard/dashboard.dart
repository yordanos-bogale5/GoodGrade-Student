// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'add_courses.dart';
import 'crud_ops/crud_student.dart';
import 'crud_ops/crud_instructor.dart';
import 'dashboard_screens/assignmentt.dart';



import 'dashboard_screens/support.dart';
import 'dashboard_screens/user.mgt.dart';

void main() {
  runApp(const AdminDashboard());
}

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({Key? key}) : super(key: key);

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
          title: const Text('Admin Dashboard'),
            backgroundColor:Colors.blue[900],
            foregroundColor:Colors.white,
            elevation: 0,
            leading: IconButton(
          icon: const Icon(Icons.arrow_back, color:Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
          ),
          body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 7.0,
              mainAxisSpacing: 0.0,
            ),
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              List<String> texts = [
                'Instructors',
                'Students',
                'Courses',
                'Quiz',
                'Assignment',
                'Answers',
              ];

              return InkWell(
                onTap: () {
                  // Handle card tap
                  print('Tapped on card ${index + 1}');
                  // Navigate to the corresponding Dart file
                  switch (index) {
                    case 0:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  const InstCrudOps(),
                        ),
                      );
                      break;
                    case 1:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const StudentCrudOps(),
                        ),
                      );
                      break;
                      case 2:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddCourses(),
                        ),
                      );
                      break;
                      case 3:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CommMgt(),
                        ),
                      );
                      break;
                      case 6:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const  HelpDesk(),
                        ),
                      );
                      break;
                      case 7:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UserMgt(),
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