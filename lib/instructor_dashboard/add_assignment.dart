// ignore_for_file: use_key_in_widget_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InstAddAssignment extends StatefulWidget {
  const InstAddAssignment({Key? key});

  @override
  // ignore: library_private_types_in_public_api
  _InstAddAssignmentState createState() => _InstAddAssignmentState();
}

class _InstAddAssignmentState extends State<InstAddAssignment> {
  List<Map<String, dynamic>> assignments = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assignment Creation'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {

              _showAddAssignmentDialog(context);
            },
            child: const Text('Add Assignment'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: assignments.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Assignment ${index + 1}'),
                  subtitle: Text(
                    'Assignment Id: ${assignments[index]['Assignment Id']} | '
                    'Assignment Name: ${assignments[index]['Assignment Name']} | '
                    'Course Id: ${assignments[index]['Course Id']} |  '
                    'Course Name: ${assignments[index]['Course Name']} |  '
                    'Assignment Description: ${assignments[index]['Assignment Description']} | '
                    'Mark %: ${assignments[index]['Mark %']} | '
                    'Assignment Type: ${assignments[index]['Assignment Type']}',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showAddAssignmentDialog(BuildContext context) {
    String assignmentId = '';
    String assignmentName = '';
    String courseId = '';
    String courseName = '';
    String assignmentDescription = '';
    String mark = '';
    String assignmentType = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Assignment'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(labelText: 'Assignment Id'),
                  onChanged: (value) {
                    assignmentId = value;
                  },
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Assignment Name'),
                  onChanged: (value) {
                    assignmentName = value;
                  },
                ),
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
                  decoration:
                      const InputDecoration(labelText: 'Assignment Description'),
                  onChanged: (value) {
                    assignmentDescription = value;
                  },
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Mark %'),
                  onChanged: (value) {
                    mark = value;
                  },
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Assignment Type'),
                  onChanged: (value) {
                    assignmentType = value;
                  },
                ),
              ],
            ),
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
                // Add the assignment to the list
                setState(() {
                  assignments.add({
                    'Assignment Id': assignmentId,
                    'Assignment Name': assignmentName,
                    'Course Id': courseId,
                    'Course Name': courseName,
                    'Assignment Description': assignmentDescription,
                    'Mark %': mark,
                    'Assignment Type': assignmentType,
                  });
                });

                // Send data to the server
                final url = Uri.https(
                  'my-creavers-project-9ae09-default-rtdb.firebaseio.com',
                  'Add-Assignment.json',
                );
                http.post(
                  url,
                  headers: {
                    'Content-Type': 'application/json',
                  },
                  body: json.encode({
                    'Assignment Id': assignmentId,
                    'Assignment Name': assignmentName,
                    'Course Id': courseId,
                    'Course Name': courseName,
                    'Assignment Description': assignmentDescription,
                    'Mark %': mark,
                    'Assignment Type': assignmentType,
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
