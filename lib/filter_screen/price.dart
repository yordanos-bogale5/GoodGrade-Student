import 'package:flutter/material.dart';

void main() => runApp(const PriceButton());

const List<String> list = <String>[
'Price',
'Free Courses',
'Paid Courses',
'Only Subscription',

];



class Price extends StatelessWidget {
  const Price({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: PriceButton(),
        ),
      ),
    );
  }
}

class PriceButton extends StatefulWidget {
  const PriceButton ({super.key});

  @override
  State<PriceButton> createState() => _PriceButtonState();
}

class _PriceButtonState extends State<PriceButton> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.white),
      underline: Container(
        height: 2,
        color: Colors.white,
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
