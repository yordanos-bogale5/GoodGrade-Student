import 'package:flutter/material.dart';

void main() {
  runApp(InstOne());
}

class InstOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Good Grade Student',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const InstructorDetailScreen(
        instructorName: 'Yordanos Bogale',
        imagePath: 'assets/staff.jpg',
        instructorDescription: 'Experienced instructor with expertise in...',
        experience: '5 years', // Replace with actual experience data
        rating: 4.5, // Replace with actual rating data
        comments: 'Great instructor!', // Replace with actual comments data
      ),
    );
  }
}

class InstructorDetailScreen extends StatelessWidget {
  final String instructorName;
  final String imagePath;
  final String instructorDescription;
  final String experience;
  final double rating;
  final String comments;

  const InstructorDetailScreen({
    required this.instructorName,
    required this.imagePath,
    required this.instructorDescription,
    required this.experience,
    required this.rating,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instructor Detail'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage(imagePath),
            ),
            const SizedBox(height: 16),
            Text(
              instructorName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              instructorDescription,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'Experience: $experience',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              'Rating: $rating',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              'Comments: $comments',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
