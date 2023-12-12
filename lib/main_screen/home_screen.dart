import 'package:creavers_project/view/wish_list.dart';
import 'package:flutter/material.dart';

import 'package:creavers_project/main_screen/teacher_month.dart';
import 'package:creavers_project/search/search_view.dart';
import 'package:creavers_project/view/account/account.dart';

import 'package:creavers_project/widgets/card_widget.dart';
import 'package:creavers_project/library_screen/shop_screen.dart';

import 'package:creavers_project/authentication_screen/log_in.dart';

import 'package:creavers_project/menu_screen/about_page/about_us.dart';

import 'package:creavers_project/Settings/setting.dart';
import 'package:creavers_project/main_screen/course_detail.dart';
import 'package:shimmer/shimmer.dart';

import '../adimin_dashboard/dashboard.dart';
import '../common/color_extenstion.dart';
import '../courses/course_dashbord.dart';


import '../menu_screen/contact_us.dart';
import '../notification/noti_view/noti_view.dart';
import '../view/cart.dart';
import 'chat.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TabController controller;

  int selectedTab = 0;

  bool isDarkMode = false;

bool isLoading = true;

  List<String> imgList = [
    'assets/Digital signal processing.webp',
    'assets/Mathematics.webp',
    'assets/Graphic Design Fundamentals.webp',
    'assets/biology.webp',
    'assets/Intercultural communication and management.webp',
    'assets/Nutrition and lifestyle during pregnancy.webp',
    'assets/Gender, family and social change.webp',
    'assets/Enviromental Science.webp',
  ];

  List<String> courseList = [
    'Digital signal processing',
    'Mathematics',
    'Graphic Design Fundamentals',
    'Biology.',
    'Intercultural communication and management',
    'Nutrition and lifestyle during pregnancy',
    'Gender, family and social change',
    'Enviromental Science',
  ];

  List<String> instList = [
    'Abebe Mola',
    'Elif Denizer',
    'Natinael Abebe',
    'Seare Hagos',
    'Milkiyas Phina',
    'Yordanos Bogale',
    'Cindy Chow',
    'Selam Tesfaye',
  ];

  void onTabTapped(int index) {
    setState(() {
      selectedTab = index;
    });

    switch (index) {
      case 0: // Account
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AccountView()),
        );
        break;
      case 1: // Search
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SearchView()),
        );
        break;
      case 2: // Learn
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CourseDashboard()),
        );
        break;
      case 3: // Wishlist
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const WishlistView()),
        );
        break;
      case 4: // Cart
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const Chat(
                    key: Key('chat'),
                  )),
        );
        break;
    }
  }

// Define light theme
  final ThemeData lightTheme = ThemeData(
    primaryColor: Colors.white,
    // ... other light theme properties
  );

// Define dark theme
  final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.black,
    // ... other dark theme properties
  );
  bool isDark = false;

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
      backgroundColor: isDark ? Colors.black : Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blue[900],
        unselectedItemColor: Colors.black,
        currentIndex: selectedTab,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Account",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: "My Courses",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Wish List",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "Chat",
          ),
        ],
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        shadowColor: Colors.transparent,
        title: const Text(
          "Good Grade Student",
          
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
            wordSpacing: 2,
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.notifications,
              color: Colors.white, // Set the color to white
            ),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue[900], // Customize the drawer header color
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/good.jpg', height: 60),
                  const SizedBox(height: 10),
                  // Add Switch for mode change
                  Padding(
                    padding: const EdgeInsets.only(top: 12, left: 218.0),
                    child: Switch(
                      activeColor: TColor.primary,
                      value: isDark,
                      onChanged: (value) {
                        setState(() {
                          isDark = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text('Library'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MarketScreen()),
                );
              },
            ),
             ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Cart'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartView()),
                );
              },
            ),
            const Divider(),
              ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Setting'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Setting()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text('Contact Us'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ContactUs()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About Us'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const About()),
                );
              },
            ),
              const Divider(),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Log In'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('admin dashboard'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AdminDashboard()),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 1, left: 3, right: 3, bottom: 0),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 6, 51, 119),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Column(
              children: [
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "TOP COURSES",
                      style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  color: Color(0xFF808080),
                  ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                if (isLoading)
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: GridView.builder(
                      itemCount: courseList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailHomeScreen(
                                  imagePath: imgList[index],
                                  courseName: courseList[index],
                                  instructorName: instList[index],
                                  coursePrice: '\$99',
                                  teacher: '',
                                  category: '',
                                ),
                              ),
                            );
                          },
                          child: CoursePage(
                            title: courseList[index],
                            instructor: instList[index],
                            price: "6.5",
                            rating: 4,
                            image: imgList[index],
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                  )
                else
                  GridView.builder(
                    itemCount: courseList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailHomeScreen(
                                imagePath: imgList[index],
                                courseName: courseList[index],
                                instructorName: instList[index],
                                coursePrice: '\$99',
                                teacher: '',
                                category: '',
                              ),
                            ),
                          );
                        },
                        child: CoursePage(
                          title: courseList[index],
                          instructor: instList[index],
                          price: "6.5",
                          rating: 4,
                          image: imgList[index],
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800],
                    ),
                    icon: const Icon(
                      Icons.explore,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Explore More Courses',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 500,
                  height: 300,
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TeacherDetailsPage(
                              teacherName: 'Selam Tesfaye',
                              teacherTitle:
                                  'Professor of Business Administration',
                              teacherDescription:
                                  'Develops and designs curriculum plans to foster student learning, stimulate class discussions, and ensures student engagement.',
                              imagePath: 'assets/teacher.jpg',
                            ),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue[800],
                                      foregroundColor: Colors.white,
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const TeacherDetailsPage(
                                            teacherName: 'Selam Tesfaye',
                                            teacherTitle:
                                                'Professor of Business Administration',
                                            teacherDescription:
                                                'Develops and designs curriculum plans to foster student learning, stimulate class discussions, and ensures student engagement.',
                                            imagePath: 'assets/teacher.jpg',
                                          ),
                                        ),
                                      );
                                    },
                                    child: const Text(' Teacher of The Month'),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    'Selam Tesfaye',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'Professor of Business Administration',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'Develops and designs curriculum plans to foster student learning, stimulate class discussions, and ensures student engagement.',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const TeacherDetailsPage(
                                      teacherName: 'Selam Tesfaye',
                                      teacherTitle:
                                          'Professor of Business Administration',
                                      teacherDescription:
                                          'Develops and designs curriculum plans to foster student learning, stimulate class discussions, and ensures student engagement.',
                                      imagePath: 'assets/teacher.jpg',
                                    ),
                                  ),
                                );
                              },
                              child: AspectRatio(
                                aspectRatio: 0.3,
                                child: Image.asset(
                                  'assets/teacher.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          top: 6,
                          bottom: 6,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            color: Colors.blue[800],
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Professional Staff',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 500,
                      height: 263,
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      'assets/staff.jpg',
                                      width: 200,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    'Yordanos Bogale',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'Software Eniginer',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[700],
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      'assets/wellcome.jpg',
                                      width: 200,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    'Elfi Denizer',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'IT Expert',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[700],
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      'assets/teacher.jpg',
                                      width: 200,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    'Cindy Chow',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'Karate & Sambo',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[700],
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      'assets/staff.jpg',
                                      width: 200,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    'Seare Hagos',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'Painting',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[700],
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      'assets/teacher.jpg',
                                      width: 200,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    'Sarah Johnson',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'Mobile Apps & Web',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyNavBar extends StatelessWidget {
  const MyNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.only(left: 5),
        child: Row(
          children: <Widget>[
            SizedBox(
              height: 25,
              width: 35,
              child: IconButton(
                onPressed: () {},
                color: Colors.white,
                icon: const Icon(Icons.menu),
              ),
            ),
            const SizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}
