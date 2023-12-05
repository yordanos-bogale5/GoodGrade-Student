// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddStd extends StatefulWidget {
  const AddStd({Key? key});

  @override
  _AddStdState createState() => _AddStdState();
}

class _AddStdState extends State<AddStd> {
  List<Map<String, String>> students = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Creation'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              // Open a dialog to add a new student
              _showAddStdDialog(context);
            },
            child: const Text('Add Student'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Student ${index + 1}'),
                  subtitle: Text(
                    'Student Name: ${students[index]['student name']} | '
                    'Father Name: ${students[index]['father name']} | '
                    'Email: ${students[index]['email']} | '
                    'Address: ${students[index]['address']} |  '
                    'Password: ${students[index]['password']} | ',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showAddStdDialog(BuildContext context) {
    String studentName = '';
    String fatherName = '';
    String email = '';
    String address = '';
    String password = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Student'),
          content: Column(
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Student Name'),
                onChanged: (value) {
                  studentName = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Father Name'),
                onChanged: (value) {
                  fatherName = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Email'),
                onChanged: (value) {
                  email = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Address'),
                onChanged: (value) {
                  address = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Password'),
                onChanged: (value) {
                  password = value;
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
                // Add the student to the list
                setState(() {
                  students.add({
                    'student name': studentName,
                    'father name': fatherName,
                    'email': email,
                    'address': address,
                    'password': password,
                  });
                });

                // Send data to the server
                final url = Uri.https(
                    'my-creavers-project-9ae09-default-rtdb.firebaseio.com',
                    'Add-Student.json');
                http.post(
                  url,
                  headers: {
                    'Content-Type': 'application/json',
                  },
                  body: json.encode({
                    'student name': studentName,
                    'father name': fatherName,
                    'email': email,
                    'address': address,
                    'password': password,
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
