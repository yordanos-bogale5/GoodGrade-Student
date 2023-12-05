// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'dashboard_screens/assignmentt.dart';
import 'dashboard_screens/quiz_mgt.dart';
import 'dashboard_screens/course_mgt.dart';
import 'dashboard_screens/report.dart';
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
            title: const Text('Adimin DashBoard'),
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
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              List<String> texts = [
                'User Management',
                'Course Management',
                'Quiz',
                'Assignment',
                'Support & Helpdesk',
                'Reports',
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
                          builder: (context) => const UserMgt(),
                        ),
                      );
                      break;
                    case 1:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CourseMgt(),
                        ),
                      );
                      break;
                      case 2:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ContentMgt(),
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
                          builder: (context) => const ReportMgt(),
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