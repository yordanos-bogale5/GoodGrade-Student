import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shimmer/shimmer.dart';
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
  bool isLoading = true; // Added loading state

  @override
  void initState() {
    super.initState();
    // Simulate data loading delay (you should replace this with actual data fetching logic)
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mathematics Course'),
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
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
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: _selectedItemIndex == index
                                ? Colors.blue[900]!
                                : Colors.transparent,
                            width: 2.0,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          _items[index],
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: _selectedItemIndex == index
                                ? Colors.blue[900]
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            if (isLoading)
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Introduction',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Container(
                        height: 16,
                        width: double.infinity,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              )
            else
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
                      'The Science of numbers and their Operations, interrelations, generalizations and abstractions. '
                      'their structure, measurement and generalizations.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),

            if (isLoading)
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Padding(
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
                      ListTile(
                        title: Container(
                          height: 16,
                          width: 150,
                          color: Colors.white,
                        ),
                      ),
                      ListTile(
                        title: Container(
                          height: 16,
                          width: 200,
                          color: Colors.white,
                        ),
                      ),
                      ListTile(
                        title: Container(
                          height: 16,
                          width: 180,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {
                          // Handle the submission
                        },
                        child: Container(
                          height: 40,
                          width: double.infinity,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            else
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
                    ListTile(
                      title: const Text('Task 1: Complete reading'),
                      leading: Checkbox(
                        value: isTask1Completed,
                        onChanged: (value) {
                          setState(() {
                            isTask1Completed = value!;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Task 2: Solve practice problems'),
                      leading: Checkbox(
                        value: isTask2Completed,
                        onChanged: (value) {
                          setState(() {
                            isTask2Completed = value!;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Task 3: Watch instructional videos'),
                      leading: Checkbox(
                        value: isTask3Completed,
                        onChanged: (value) {
                          setState(() {
                            isTask3Completed = value!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        // Handle the submission
                      },
                      child: const Text('Submit Tasks'),
                    ),
                  ],
                ),
              ),
              
          const SizedBox(height: 10),
            if (isLoading)
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
            child: Padding(
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
              )
              else
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
        
              
            if (isLoading)
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: const Padding(
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
              )
            else
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
                    // Your content here
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

            if (isLoading)
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: const Padding(
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
              )
            else
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
                    // Your content here
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
