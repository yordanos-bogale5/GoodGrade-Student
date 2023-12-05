// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

void main() {
  runApp(const ReportMgt());
}

class ReportMgt extends StatelessWidget {
  const ReportMgt({Key? key}) : super(key: key);

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
            title: const Text('Content Management'),
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
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              List<IconData> icons = [
                Icons.logo_dev,
                Icons.book,
                Icons.percent_outlined,
                Icons.dashboard,
                Icons.network_cell,
                Icons.notifications,
              ];

              List<String> texts = [
                'Report Generation',
                'User Analytics',
                'Course Analytics',
                'Learning Path Analytics',
                'Assessment Analytics',
                'Custom Reporting',
                'Data Visualization',
                'Progress Tracking',
              ];

              return InkWell(
                onTap: () {
                  // Handle card tap
                  print('Tapped on card ${index + 1}');
                },
                child: Card(
                  elevation: 4.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        icons[index],
                        size: 50,
                        color: Colors.grey,
                      ),
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
