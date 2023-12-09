import 'package:flutter/material.dart';

void main() => runApp(const statusList());

const List<String> list = <String>[
'Status',
'Featured',
' Hot',
'New',
'Special',

];



class Status extends StatelessWidget {
  const Status({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: statusList(),
        ),
      ),
    );
  }
}

class statusList extends StatefulWidget {
  const statusList ({super.key});

  @override
  State<statusList> createState() => _statusListState();
}

class _statusListState extends State<statusList> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.pink),
      underline: Container(
        height: 2,
        color: Colors.pink,
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
