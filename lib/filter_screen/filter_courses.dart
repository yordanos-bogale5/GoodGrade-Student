import 'package:flutter/material.dart';


class FilterPage extends StatelessWidget {
  const FilterPage({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> catNames = [
      "Category",
      "Status",
      "Level",
      "Ratings",
      "Instructors",
      "Price",
    ];
    List<Color> catColor = [
      const Color(0xFF00FFFF),
      const Color(0xFFFFC0CB),
      const Color(0xFFFF00FF),
      const Color(0xFF00FF00),
      const Color(0xFFA52A2A),
      const Color(0xFF808080),
    ];

    List<IconData> catIcons = [
      Icons.category,
      Icons.info,
      Icons.arrow_upward,
      Icons.star,
      Icons.people,
      Icons.money,
    ];

    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
            child: Column(
              children: [
                GridView.builder(
                  itemCount: catNames.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.1,
                  ),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: catColor[index],
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              catIcons[index],
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          catNames[index],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[700],
                          foregroundColor: Colors.white,
  ),
  onPressed: () { },
  child: const Text('Show Results'),
),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
    Category({Key? key}) : super(key: key);

    final List<String> list = [
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

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CategoryButton(),
      ),
    );
  }
}

class CategoryButton extends StatefulWidget {
  const CategoryButton({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CategoryButtonState createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = list.first;
  }

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
        if (value != null) {
          setState(() {
            dropdownValue = value;
          });
        }
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
          child: StatusButton(),
        ),
      ),
    );
  }
}

class StatusButton extends StatefulWidget {
  const StatusButton ({super.key});

  @override
  State<StatusButton> createState() => _StatusButtonState();
}

class _StatusButtonState extends State<StatusButton> {
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

List<String> listlevel = <String>[
'level',
'Beginner',
'Intermediate',
'Advance',

];



class Level extends StatelessWidget {
  const Level({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: LevelButton(),
        ),
      ),
    );
  }
}

class LevelButton extends StatefulWidget {
  const LevelButton ({super.key});

  @override
  State<LevelButton> createState() => _LevelButtonState();
}

class _LevelButtonState extends State<LevelButton> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
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

const List<String> listrating = <String>[
'Rating',
'one star',
'one star',
'one star',

];



class Rating extends StatelessWidget {
  const Rating({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: RatingButton(),
        ),
      ),
    );
  }
}

class RatingButton extends StatefulWidget {
  const RatingButton ({super.key});

  @override
  State<RatingButton> createState() => _RatingButtonState();
}

class _RatingButtonState extends State<RatingButton> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.lime),
      underline: Container(
        height: 2,
        color: Colors.lime,
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


const List<String> listinstructor = <String>[
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

const List<String> listprice = <String>[
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




