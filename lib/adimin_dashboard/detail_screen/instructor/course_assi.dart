// CourseAssignment.dart
// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CourseAssignment extends StatefulWidget {
  const CourseAssignment({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CourseAssignmentState createState() => _CourseAssignmentState();
}

class _CourseAssignmentState extends State<CourseAssignment> {
  List<Course> courses = [
    Course(id: 1, name: 'Math 101', instructor: 'John Doe'),
    Course(id: 2, name: 'English 201', instructor: 'Jane Smith'),
    // Add more courses as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Assignment'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('Course Name')),
            DataColumn(label: Text('Instructor')),
            DataColumn(label: Text('Action')),
          ],
          rows: courses
              .map(
                (course) => DataRow(
                  cells: [
                    DataCell(Text('${course.id}')),
                    DataCell(Text(course.name)),
                    DataCell(Text(course.instructor)),
                    DataCell(
                      ElevatedButton(
                        onPressed: () {
                          // Handle the action when the button is pressed
                          print('Assign Course for ${course.instructor}');
                        },
                        child: const Text('Assign Course'),
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Open a dialog to add a new course
          _showAddCourseDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddCourseDialog(BuildContext context) {
    String name = '';
    String instructor = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Course'),
          content: Column(
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Course Name'),
                onChanged: (value) {
                  name = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Instructor'),
                onChanged: (value) {
                  instructor = value;
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
                  courses.add(Course(id: courses.length + 1,
                  name: name,
                  instructor: instructor));
                });
                  final url = Uri.https(
                    'my-creavers-project-9ae09-default-rtdb.firebaseio.com',
                    'Course-Assigning.json');
                http.post(
                  url,
                  headers: {
                    'assign-courses': 'application/json',
                  },
                  body: json.encode(
                    {
                      'Course name':  name,
                  'instructor': instructor,
                    },
                  ),
                );

                Navigator.pop(context);
              },
              child: const Text('Add Course'),
            ),
          ],
        );
      },
    );
  }
}

class Course {
  final int id;
  final String name;
  final String instructor;

  Course({required this.id, required this.name, required this.instructor});
}
