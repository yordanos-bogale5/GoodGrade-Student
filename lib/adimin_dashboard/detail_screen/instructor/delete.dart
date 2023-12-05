import 'package:flutter/material.dart';

void main() {
  runApp(const DeleteUser());
}

class DeleteUser extends StatelessWidget {
  const DeleteUser({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Delete User'),
        ),
        body: const DeleteRowExample(),
      ),
    );
  }
}

class DeleteRowExample extends StatefulWidget {
  const DeleteRowExample({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DeleteRowExampleState createState() => _DeleteRowExampleState();
}

class _DeleteRowExampleState extends State<DeleteRowExample> {
  List<Instructor> instructors = [
    Instructor(id: 1, name: 'Yordanos Bogale', email: 'bogaleyordanos64@gmail.com', role: 'Instructor'),
    Instructor(id: 2, name: 'Jordan Bo', email: 'bogaleyordanos@gmail.com', role: 'Assistant Instructor'),
    // Add more instructors as needed
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
        columns: const [
          DataColumn(label: Text('ID')),
          DataColumn(label: Text('Name')),
          DataColumn(label: Text('Email')),
          DataColumn(label: Text('Role')),
          DataColumn(label: Text('Action')),
        ],
        rows: instructors
            .asMap()
            .entries
            .map(
              (entry) => DataRow(
                cells: [
                  DataCell(Text('${entry.value.id}')),
                  DataCell(Text(entry.value.name)),
                  DataCell(Text(entry.value.email)),
                  DataCell(Text(entry.value.role)),
                  DataCell(
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        _deleteRow(entry.key);
                      },
                    ),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }

  void _deleteRow(int index) {
    setState(() {
      // Remove the item at the specified index
      instructors.removeAt(index);
    });
  }
}

class Instructor {
  final int id;
  final String name;
  final String email;
  final String role;

  Instructor({required this.id, required this.name, required this.email, required this.role});
}
