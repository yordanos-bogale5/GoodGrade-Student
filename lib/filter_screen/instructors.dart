import 'package:flutter/material.dart';

void main() => runApp(const InstructorButton());

const List<String> list = <String>[
'Instructors',
'Yordanos',
'Seare',
'Phina',
'Dada',

];



class Instructor extends StatelessWidget {
  const Instructor({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: InstructorButton(),
        ),
      ),
    );
  }
}

class InstructorButton extends StatefulWidget {
  const InstructorButton ({super.key});

  @override
  State<InstructorButton> createState() => _InstructorButtonState();
}

class _InstructorButtonState extends State<InstructorButton> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.brown),
      underline: Container(
        height: 2,
        color: Colors.brown,
      ),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
