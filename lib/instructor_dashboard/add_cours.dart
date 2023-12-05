// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InstAddCourse extends StatefulWidget {
  const InstAddCourse({Key? key});

  @override
  _InstAddCourseState createState() => _InstAddCourseState();
}

class _InstAddCourseState extends State<InstAddCourse> {
  List<Map<String, String>> courses = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Creation'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              // Open a dialog to add a new course
              _showAddCourseDialog(context);
            },
            child: const Text('Add Courses'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: courses.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Course ${index + 1}'),
                  subtitle: Text(
                    'Course Id: ${courses[index]['Course Id']} | '
                    'Course Name: ${courses[index]['Course Name']} |  '
                    'Course Duration: ${courses[index]['Course Duration']} | '
                    'Course Description : ${courses[index]['Course Description']}',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showAddCourseDialog(BuildContext context) {
    String courseId = '';
    String courseName = '';
    String courseDuration = '';
    String courseDescription = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Course'),
          content: Column(
            children: [
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
                decoration: const InputDecoration(labelText: 'Course Duration'),
                onChanged: (value) {
                  courseDuration = value;
                },
              ),
              TextField(
                decoration:
                    const InputDecoration(labelText: 'Course Description'),
                onChanged: (value) {
                  courseDescription = value;
                },
              ),
            ],
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
                // Add the course to the list
                setState(() {
                  courses.add({
                    'Course Id': courseId,
                    'Course Name': courseName,
                    'Course Duration': courseDuration,
                    'Course Description': courseDescription,
                  });
                });

                // Send data to the server
                final url = Uri.https(
                    'my-creavers-project-9ae09-default-rtdb.firebaseio.com',
                    'Add-Course.json');
                http.post(
                  url,
                  headers: {
                    'Content-Type': 'application/json',
                  },
                  body: json.encode({
                    'Course Id': courseId,
                    'Course Name': courseName,
                    'Course Duration': courseDuration,
                    'Course Description': courseDescription,
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
