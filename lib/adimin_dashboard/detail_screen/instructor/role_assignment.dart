// InstructorRoleAssignment.dart
import 'package:flutter/material.dart';

class InstructorRoleAssignment extends StatefulWidget {
  const InstructorRoleAssignment({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _InstructorRoleAssignmentState createState() =>
      _InstructorRoleAssignmentState();
}

class _InstructorRoleAssignmentState extends State<InstructorRoleAssignment> {
  List<Instructor> instructors = [
    Instructor(id: 1, name: 'John Doe', role: 'Instructor'),
    Instructor(id: 2, name: 'Jane Smith', role: 'Assistant Instructor'),
    // Add more instructors as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instructor Role Assignment'),
      ),
      body: SingleChildScrollView(
        child: DataTable(
          columns: const [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Role')),
            DataColumn(label: Text('Action')),
          ],
          rows: instructors
              .map((instructor) => DataRow(
                    cells: [
                      DataCell(Text('${instructor.id}')),
                      DataCell(Text(instructor.name)),
                      DataCell(Text(instructor.role)),
                      DataCell(
                        ElevatedButton(
                          onPressed: () {
                            // Handle the action when the button is pressed
                            // ignore: avoid_print
                            print('Assign Role for ${instructor.name}');
                          },
                          child: const Text('Assign Role'),
                        ),
                      ),
                    ],
                  ))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Open a dialog to add a new instructor
          _showAddInstructorDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddInstructorDialog(BuildContext context) {
    String name = '';
    String role = '';

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
                decoration: const InputDecoration(labelText: 'Role'),
                onChanged: (value) {
                  role = value;
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
                // Add the instructor to the list
                setState(() {
                  instructors.add(Instructor(id: instructors.length + 1, name: name, role: role));
                });
                Navigator.pop(context);
              },
              child: const Text('Add Instructor'),
            ),
          ],
        );
      },
    );
  }
}

class Instructor {
  final int id;
  final String name;
  final String role;

  Instructor({required this.id, required this.name, required this.role});
}
