import 'package:flutter/material.dart';

void main() => runApp(const Category());

const List<String> list = <String>[
    'Category',
'Photography',
'Software training',
'Environmental Sciences',
'Material Design',
'Music',
'Art',
'Mathematics',
'Biology',
'Marketing',
'Computer Basics',
'Electronic',
'Digital signal processing',

];



class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: CategoryButton(),
        ),
      ),
    );
  }
}

class CategoryButton extends StatefulWidget {
  const CategoryButton ({super.key});

  @override
  State<CategoryButton> createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.cyan),
      underline: Container(
        height: 2,
        color: Colors.cyan,
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
