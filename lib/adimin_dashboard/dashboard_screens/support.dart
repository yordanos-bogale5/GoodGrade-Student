// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

void main() {
  runApp(const HelpDesk());
}

class HelpDesk extends StatelessWidget {
  const HelpDesk({Key? key}) : super(key: key);

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
            itemCount: 7, // Adjusted to display seven items
            itemBuilder: (BuildContext context, int index) {
              List<IconData> icons = [
                Icons.book,
                Icons.backpack,
                Icons.shield,
                Icons.lock,
                Icons.bar_chart,
                Icons.fingerprint,
                Icons.info, // Additional icon for the seventh item
              ];

              List<String> texts = [
                'Orientation',
                'Training Sessions',
                'Documentation and Guides',
                'User Support',
                'System Updates',
                'Feedback Collection',
                'Release Notes', // Additional text for the seventh item
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
                        color: Colors.blue[700],
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
