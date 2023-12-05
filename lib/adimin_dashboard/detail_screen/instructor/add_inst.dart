import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddInstr extends StatefulWidget {
  const AddInstr({Key? key}) : super(key: key);

  @override
  _AddInstrState createState() => _AddInstrState();
}

class _AddInstrState extends State<AddInstr> {
  List<Map<String, String>> instructors = [];
  String selectedRole = ''; // Track the selected role for the dropdown

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
              // Open a dialog to add a new instructor
              _showAddInstructorDialog(context);
            },
            child: const Text('Add Instructor'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: instructors.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Instructor ${index + 1}'),
                  subtitle: Text(
                    'Email: ${instructors[index]['email']} | '
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

  void _showAddInstructorDialog(BuildContext context) {
    String name = '';
    String email = '';
    String address = '';
    String salary = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Instructor'),
          content: Column(
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Name'),
                onChanged: (value) {
                  name = value;
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
                decoration: const InputDecoration(labelText: 'Salary'),
                onChanged: (value) {
                  salary = value;
                },
              ),
              DropdownButton<String>(
                value: selectedRole,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.black),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
             
                items: ['Admin', 'User', 'Guest'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(), onChanged: (String? value) {  },
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
              onPressed: () async {
                // Add the instructor to the list
                setState(() {
                  instructors.add({
                    'name': name,
                    'email': email,
                    'address': address,
                    'salary': salary,
                    'role': selectedRole,
                  });
                });

                final url = Uri.https(
                  'my-creavers-project-9ae09-default-rtdb.firebaseio.com',
                  'Add-Instructor.json',
                );

                await http.post(
                  url,
                  headers: {'Content-Type': 'application/json'},
                  body: json.encode(
                    {
                      'name': name,
                      'email': email,
                      'address': address,
                      'salary': salary,
                      'role': selectedRole,
                    },
                  ),
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
