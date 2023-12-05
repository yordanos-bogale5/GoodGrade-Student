import 'package:flutter/material.dart';

import 'detail.dashboard.dart';

void main() {
  runApp(const MaterialApp(
    home: CourseDashboard(),
  ));
}

class CourseDashboard extends StatefulWidget {
  const CourseDashboard({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CourseDashboardState createState() => _CourseDashboardState();
}

class _CourseDashboardState extends State<CourseDashboard> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Enrolled Courses',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue[900],
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'My Courses',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: SizedBox(
                              width: double.infinity,
                              height: 150.0,
                              child: ListTile(
                                leading: const Icon(Icons.book),
                                title: const Text('Physics'),
                                subtitle: const Text('Instructor: Yordanos Bogale'),
                                trailing: const Icon(Icons.check),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const DetailCourseScreen(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: SizedBox(
                              width: double.infinity,
                              height: 150.0,
                              child: ListTile(
                                leading: const Icon(Icons.book),
                                title: const Text('biology'),
                                subtitle: const Text('Instructor: DR. Selam Tesfaye'),
                                trailing: const Icon(Icons.check),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const DetailCourseScreen(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: SizedBox(
                              width: double.infinity,
                              height: 150.0,
                              child: ListTile(
                                leading: const Icon(Icons.book),
                                title: const Text('Mathmatics'),
                                subtitle: const Text('Instructor: Elif Denizer'),
                                trailing: const Icon(Icons.check),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const DetailCourseScreen(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          // Add more cards for each course
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
