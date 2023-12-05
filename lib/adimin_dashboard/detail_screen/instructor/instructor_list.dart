// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'add_inst.dart';

class Instructor {
  final String id;
  String name;
  String fathersName;
  String role;
  String address;
  double salary;

  Instructor({
    required this.id,
    required this.name,
    required this.fathersName,
    required this.role,
    required this.address,
    required this.salary,
  });
}

class InstList {
  final String id;
  final String name;
  final String email;
  final String address;
  final double salary;
  final String role;

  InstList({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.salary,
    required this.role,
  });
}

class InstructorList extends StatefulWidget {
  @override
  _InstructorListState createState() => _InstructorListState();
}

class _InstructorListState extends State<InstructorList> {
  late List<InstList> _loadedInstructors;

  @override
  void initState() {
    super.initState();
    _loadedInstructors = [];
    _loadInstructors();
  }
void _loadInstructors() async {
  final url = Uri.https(
      'my-creavers-project-9ae09-default-rtdb.firebaseio.com', 'Add-Instructor.json');
  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic>? listData = json.decode(response.body);
      final List<InstList> loadedItems = [];

      if (listData != null) {
        listData.forEach((id, instructorData) {
          loadedItems.add(
            InstList(
              id: id,
              name: instructorData['name'],
              email: instructorData['email'],
              address: instructorData['address'],
              salary: instructorData['salary'],
              role: instructorData['role'],
            ),
          );
        });

        setState(() {
          _loadedInstructors = loadedItems;
        });
      } else {
        print('Firebase data is empty.');
      }
    } else {
      print('Failed to fetch instructors: ${response.statusCode}');
    }
  } catch (error) {
    print('Error loading instructors: $error');
  }
}


  void _addIntructor(BuildContext context) async {
    final result = await Navigator.of(context).push<InstList>(
      MaterialPageRoute(
        builder: (ctx) => const AddInstr( key: Key(' AddInstr '),),
      ),
    );

    if (result != null) {
      _loadInstructors();
    }
  }

 void _updateInstructor(InstList instructor) async {
  final url = Uri.https(
      'my-creavers-project-9ae09-default-rtdb.firebaseio.com',
      'Add-Instructor/${instructor.id}.json');

  final response = await http.patch(
    url,
    body: json.encode({
      'name': 'Updated ${instructor.name}',
      'salary': instructor.salary + 5000.0,
    }),
  );

  if (response.statusCode == 200) {
    // Update the local state if the server update is successful
    setState(() {
      _loadedInstructors = [
        ..._loadedInstructors.where((item) => item.id != instructor.id),
        InstList(
          id: instructor.id,
          name: 'Updated ${instructor.name}',
          email: instructor.email,
          address: instructor.address,
          salary: instructor.salary + 5000.0,
          role: instructor.role,
        ),
      ];
    });
  } else {
    // Handle error scenario
    print('Failed to update instructor: ${response.statusCode}');
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instructor List'),
      ),
      body: ListView.builder(
        itemCount: _loadedInstructors.length,
        itemBuilder: (context, index) {
          final instructor = _loadedInstructors[index];
          return ListTile(
            title: Text('ID: ${instructor.id} | ${instructor.name}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Email: ${instructor.email}'),
                Text('Address: ${instructor.address}'),
                Text('Salary: \$${instructor.salary}'),
                Text('Role: ${instructor.role}'),
              ],
            ),
            trailing: ElevatedButton(
              onPressed: () {
                _updateInstructor(instructor);
              },
              child: const Text('Update'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addIntructor(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: InstructorList(),
  ));
}
