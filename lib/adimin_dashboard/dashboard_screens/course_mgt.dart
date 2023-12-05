// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import '../detail_screen/course/add_courses.dart';

void main() {
  runApp(const CourseMgt());
}

class CourseMgt extends StatelessWidget {
  const CourseMgt({Key? key}) : super(key: key);

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
            title: const Text('Course Management'),
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
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              List<IconData> icons = [
                Icons.book,
                Icons.backpack,
              ];

              List<String> texts = [
                'Add Course',
                'Course List',
              ];
              return InkWell(
                onTap: () {
                  // Handle card tap
                  print('Tapped on card ${index + 1}');
                    switch (index) {
                    case 0:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddCourse(),
                        ),
                      );
                      break;
                    case 1:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddCourse(),
                        ),
                      );
                      break;
                    default:
                      break;
                  }
                },
                child: Card(
                  elevation: 4.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        icons[index],
                        size: 50,
                        color: Colors.blue,
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: Text(
                          texts[index],
                          style: const TextStyle(fontSize: 18),
                        ),
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
