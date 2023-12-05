import 'package:flutter/material.dart';



class CoursePage extends StatelessWidget {
  final String title;
  final String instructor;
  final String price;
  final double rating;
  final String image;

  const CoursePage({super.key,
    required this.title,
    required this.instructor,
    required this.price,
    required this.rating,
    required this.image, required Color color,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.transparent,
      color: Colors.white,
      shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(30)),
      elevation: 4.0,
      margin: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            image,
            height: 150.0,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text('Instructor: $instructor'),
                const SizedBox(height: 8.0),
                Text('Price: $price'),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Text('$rating'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
