// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddInstr extends StatefulWidget {
  const AddInstr({Key? key});

  @override
  _AddInstrState createState() => _AddInstrState();
}

class _AddInstrState extends State<AddInstr> {
  List<Map<String, String>> instructors = [];
  late String instructorName;
  late String fatherName;
  late String email;
  late String address;
  late String password;
  late String salary;
  late String role;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Instructors'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              // Open a dialog to add a new course
              _showAddInstrDialog(context);
            },
            child: const Text('Add Instructors'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: instructors.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Instructors ${index + 1}'),
                  subtitle: Text(
                    'Instructor Name: ${instructors[index]['Instructor name']} | '
                        'Father Name: ${instructors[index]['father name']} | '
                        'Email: ${instructors[index]['email']} | '
                        'Password: ${instructors[index]['password']} | '
                        'Address: ${instructors[index]['address']} |  '
                        'Salary: ${instructors[index]['salary']} | '
                        'Role: ${instructors[index]['role']}',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showAddInstrDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Instructor'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(labelText: 'Instructor Name'),
                  onChanged: (value) {
                    instructorName = value;
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
                TextField(
                  decoration: const InputDecoration(labelText: 'Salary'),
                  onChanged: (value) {
                    salary = value;
                  },
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Role'),
                  onChanged: (value) {
                    role = value;
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
                // Add the instructor to the list
                setState(() {
                  instructors.add({
                    'Instructor name': instructorName,
                    'father name': fatherName,
                    'email': email,
                    'address': address,
                    'password': password,
                    'salary': salary,
                    'role': role,
                  });
                });

                // Send data to the server
                final url = Uri.https(
                  'my-creavers-project-9ae09-default-rtdb.firebaseio.com',
                  'instructors.json',
                );
                http.post(
                  url,
                  headers: {
                    'Content-Type': 'application/json',
                  },
                  body: json.encode({
                    'Instructor name': instructorName,
                    'father name': fatherName,
                    'email': email,
                    'address': address,
                    'password': password,
                    'salary': salary,
                    'role': role,
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
