// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import '../detail_screen/instructor/student/add_student.dart';


void main() {
  runApp(const StdMgt());
}

class StdMgt extends StatelessWidget {
  const StdMgt({Key? key}) : super(key: key);

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
            title: const Text('Student Management'),
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
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              List<String> texts = [
              'Add Account',
              'Enrollment',
              'Delete Account',
              'Update Account',
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
                          builder: (context) => const  AddStd (),
                        ),
                      );
                      break;
                    case 1:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddStd(),
                        ),
                      );
                      break;
                    case 2:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddStd(),
                        ),
                      );
                      break;
                        case 3:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddStd(),
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
