import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'quiz.dart';

int _selectedItemIndex = 0;
late final User user;
final List<String> _items = [
  'Week 1',
  'Week 2',
  'Week 3',
  'Week 4',
  'Week 5',
  'Week 6',
  'Week 7',
  'Week 8',
];

void main() {
  runApp(const MaterialApp(
    home: DetailCourseScreen(),
  ));
}

class DetailCourseScreen extends StatefulWidget {
  const DetailCourseScreen({Key? key}) : super(key: key);

  @override
  _DetailCourseScreenState createState() => _DetailCourseScreenState();
}

class _DetailCourseScreenState extends State<DetailCourseScreen> {
  bool isTask1Completed = false;
  bool isTask2Completed = false;
  bool isTask3Completed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mathematics Course'),
          backgroundColor:Colors.black,
            foregroundColor:Colors.white,
            elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 50.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedItemIndex = index;
                      });
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(37.0),
                      child: Container(
                        color: _selectedItemIndex == index
                            ? Colors.blue[900]
                            : Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            _items[index],
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: _selectedItemIndex == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Introduction',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'The Science of numbers and their Operations, interrelations, generalizations and abstractions.'
                    'their structure, measurement and generalizations.',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Daily Tasks',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  CheckboxListTile(
                    title: const Text('Solve exercises from chapter 1'),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: isTask1Completed,
                    onChanged: (bool? value) {
                      setState(() {
                        isTask1Completed = value ?? false;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Watch video tutorial on algebra'),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: isTask2Completed,
                    onChanged: (bool? value) {
                      setState(() {
                        isTask2Completed = value ?? false;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Complete assigned problems'),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: isTask3Completed,
                    onChanged: (bool? value) {
                      setState(() {
                        isTask3Completed = value ?? false;
                      });
                    },
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      // Handle the submission
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizApp(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800],
                ),
                icon: const Icon(
                  Icons.timer,
                  color: Colors.white,
                ),
                label: const Text(
                  'Start Quiz',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Videos',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Card(
                    margin: EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 120.0,
                      child: ListTile(
                        leading: Icon(Icons.video_library),
                        title: Text('Introduction to Algebra'),
                        subtitle: Text(
                          'Duration: 5:30',
                        ),
                      ),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 120.0,
                      child: ListTile(
                        leading: Icon(Icons.video_library),
                        title: Text('Solving Equations'),
                        subtitle: Text(
                          'Duration: 7:45',
                        ),
                      ),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 120.0,
                      child: ListTile(
                        leading: Icon(Icons.video_library),
                        title: Text('Geometry Basics'),
                        subtitle: Text(
                          'Duration: 4:15',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Curriculum',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  CurriculumList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CurriculumList extends StatelessWidget {
  const CurriculumList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 8,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.library_books),
          title: Text('Chapter ${index + 1} - Algebra'),
          subtitle: const Text('Solving equations, inequalities'),
          onTap: () {
            // Handle curriculum item tap
            // You can navigate to a detailed chapter screen or perform other actions.
          },
        );
      },
    );
  }
}
