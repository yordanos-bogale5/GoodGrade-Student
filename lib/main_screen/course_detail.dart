
import 'package:flutter/material.dart';

import '../authentication_screen/log_in.dart';

import '../view/wish_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    // ignore: use_key_in_widget_constructors
    const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}

class DetailHomeScreen extends StatefulWidget {
  final String imagePath;
  final String courseName;
  final String instructorName;
  final String coursePrice;
  final String teacher;
  final String category;

  const DetailHomeScreen({
    Key? key,
    required this.imagePath,
    required this.courseName,
    required this.instructorName,
    required this.coursePrice,
    required this.teacher,
    required this.category,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DetailHomeScreenState createState() => _DetailHomeScreenState();
}

class _DetailHomeScreenState extends State<DetailHomeScreen> {
  late TabController controller;

  int selectedTab = 0;

  void onTabTapped(int index) {
    setState(() {
      selectedTab = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => LoginScreen()),
        );
        break;
      case 1: // Search
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const  WishlistView ()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[900],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: selectedTab,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.how_to_reg),
            label: "Enroll now",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: "Add to wishlist",
          ),
        ],
      ),
      appBar: AppBar(
        title: const Text('Course Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: 500,
              height: 200,
              child: Card(
                elevation: 4,
                margin: const EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly, // Add vertical spacing
                    children: [
                      Text(
                        widget.courseName,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Text(
                            '4.8',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Icon(
                            Icons.star,
                            color: Colors.amber[900],
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.amber[900],
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.amber[900],
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.amber[900],
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.amber[900],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Provided by',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black38,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Good Grade Student',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Text(
              'Course Overview',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(
                  left: 8.0), // Adjust the left padding as desired
              child: Text(
                'This course examines the transformation of Korean society from the turn of the twentieth century to the contemporary era. In particular, it explores how changing categories of masculinity, and in contrast, femininity have impacted on, and in turn have been influenced by, social, cultural, and political changes.',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(
                  left: 16.0, top: 8.0), // Adjust the top padding as desired
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.wifi,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Fully Online',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 1),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Text(
                      'Self-paced Learning',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                  left: 16.0, top: 8.0), // Adjust the top padding as desired
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Adjustable timelines',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 1),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Text(
                      'Modify deadline to accommodate your schedule',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                  left: 16.0, top: 8.0), // Adjust the top padding as desired
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.lightbulb_outline,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'For Beginners',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Text(
                      'Suitable for beginners',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(
                  right: 200.0), // Adjust the left padding as desired
              child: Text(
                'Skills You will aquire',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.white, // Set the background color to grey
                      ),
                      child: const Text(
                        'Problem-solving',
                        style: TextStyle(
                          color: Colors.black, // Set the text color to black
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.white, // Set the background color to grey
                      ),
                      child: const Text(
                        'Critical thinking',
                        style: TextStyle(
                          color: Colors.black, // Set the text color to black
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                    height: 8.0), // Add some spacing between the rows
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.white, // Set the background color to grey
                      ),
                      child: const Text(
                        'Numerical proficiency',
                        style: TextStyle(
                          color: Colors.black, // Set the text color to black
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.white, // Set the background color to grey
                      ),
                      child: const Text(
                        'Mathematical modeling',
                        style: TextStyle(
                          color: Colors.black, // Set the text color to black
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding:
                      EdgeInsets.all(16.0), // Adjust the padding as desired
                  child: Text(
                    'Courses to start with',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      top: 3.0, left: 0), // Adjust the margin as needed
                  height: 2.0,
                  color: Colors.grey, // You can change the color as desired
                ),
                const SizedBox(
                    height:
                        8.0), // Add some spacing between the line and the text
                const Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Top Courses',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Relevant to your interests',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                // Additional course-related widgets can be added below
              ],
            ),
            SizedBox(
              width: 500,
              height: 300,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: SizedBox(
                      width: 200,
                      height: 250,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              'assets/calcules.jpg',
                              width: 200,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Calculus',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Mr. Tadele Kelayu, Mr. Yordanos',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.only(right: 60),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.star, color: Colors.amber[900]),
                                Icon(Icons.star, color: Colors.amber[900]),
                                Icon(Icons.star, color: Colors.amber[900]),
                                Icon(Icons.star, color: Colors.amber[900]),
                                Icon(Icons.star_half, color: Colors.amber[900]),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Padding(
                            padding: EdgeInsets.only(right: 120),
                            child: Text(
                              '\$9.99',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: SizedBox(
                      width: 200,
                      height: 250,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              'assets/calcules.jpg',
                              width: 200,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Calculus',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Mr. Tadele Kelayu, Mr. Yordanos',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.only(right: 60),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.star, color: Colors.amber[900]),
                                Icon(Icons.star, color: Colors.amber[900]),
                                Icon(Icons.star, color: Colors.amber[900]),
                                Icon(Icons.star, color: Colors.amber[900]),
                                Icon(Icons.star_half, color: Colors.amber[900]),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Padding(
                            padding: EdgeInsets.only(right: 120),
                            child: Text(
                              '\$9.99',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: SizedBox(
                      width: 200,
                      height: 250,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              'assets/calcules.jpg',
                              width: 200,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Calculus',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Mr. Tadele Kelayu, Mr. Yordanos',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.only(right: 60),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.star, color: Colors.amber[900]),
                                Icon(Icons.star, color: Colors.amber[900]),
                                Icon(Icons.star, color: Colors.amber[900]),
                                Icon(Icons.star, color: Colors.amber[900]),
                                Icon(Icons.star_half, color: Colors.amber[900]),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Padding(
                            padding: EdgeInsets.only(right: 120),
                            child: Text(
                              '\$9.99',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: SizedBox(
                      width: 200,
                      height: 250,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              'assets/calcules.jpg',
                              width: 200,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Calculus',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Mr. Tadele Kelayu, Mr. Yordanos',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.only(right: 60),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.star, color: Colors.amber[900]),
                                Icon(Icons.star, color: Colors.amber[900]),
                                Icon(Icons.star, color: Colors.amber[900]),
                                Icon(Icons.star, color: Colors.amber[900]),
                                Icon(Icons.star_half, color: Colors.amber[900]),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Padding(
                            padding: EdgeInsets.only(right: 120),
                            child: Text(
                              '\$9.99',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: SizedBox(
                      width: 200,
                      height: 250,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              'assets/calcules.jpg',
                              width: 200,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Calculus',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Mr. Tadele Kelayu, Mr. Yordanos',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.only(right: 60),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.star, color: Colors.amber[900]),
                                Icon(Icons.star, color: Colors.amber[900]),
                                Icon(Icons.star, color: Colors.amber[900]),
                                Icon(Icons.star, color: Colors.amber[900]),
                                Icon(Icons.star_half, color: Colors.amber[900]),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Padding(
                            padding: EdgeInsets.only(right: 120),
                            child: Text(
                              '\$9.99',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Add more Card widgets here as needed
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(right: 200.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.blue[900], // Set the background color to blue[900]
                ),
                child: const Text(
                  'Curriculum',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Set the text color to white
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Algebra',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text('Introduction to Algebra'),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Solving Equations'),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Inequalties'),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Polynomials'),
                  ),
                  Divider(),
                ],
              ),
            ),
            const Text(
              'Calculation and analysis',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text('Overview'),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Vector Spaces in Mathematics'),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Inequalties'),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Polynomials'),
                  ),
                  Divider(),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(
                  left: 18.0), // Adjust the left padding as desired
              child: Row(
                children: [
                  const Text(
                    '4.8',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                      width: 8.0), // Add some space between the text and icons
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber[900],
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber[900],
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber[900],
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber[900],
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber[900],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 500, // Adjust the width as per your needs
              child: Card(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            'Instructors',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(
                                'assets/staff.jpg',
                              ), // Replace with the actual image path
                            ),
                            SizedBox(height: 8.0),
                            Text('Seare Hagos'),
                            SizedBox(height: 4.0),
                            Text(
                              'Addis Ababa University Lecturer',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                            height: 16.0), // Add spacing between instructors
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(
                                'assets/teacher.jpg',
                              ), // Replace with the actual image path
                            ),
                            SizedBox(height: 8.0),
                            Text('Selam Tesfaye'),
                            SizedBox(height: 4.0),
                            Text(
                              'Professor of Business Administration',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.school, color: Colors.grey[700]),
                      const SizedBox(width: 5),
                      Text(
                        'Enrolled: ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                        ),
                      ),
                      Text(
                        '3 students',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Container(
                    height: 1,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.timer, color: Colors.grey[700]),
                      const SizedBox(width: 5),
                      Text(
                        'Duration: ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                        ),
                      ),
                      Text(
                        '3 Weeks',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Container(
                    height: 1,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.library_books, color: Colors.grey[700]),
                      const SizedBox(width: 5),
                      Text(
                        'Lectures: ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                        ),
                      ),
                      Text(
                        '4',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Container(
                    height: 1,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.grey[700]),
                      const SizedBox(width: 5),
                      Text(
                        'Level: ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                        ),
                      ),
                      Text(
                        'Intermediate',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
