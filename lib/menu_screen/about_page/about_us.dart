import 'package:flutter/material.dart';


import '../../constants/constant.dart';
import 'component/desc_section.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(
      fontSize: 18.0,
      color: Colors.black54,
    );

    return Scaffold(
        appBar: AppBar(
          title: const Text('About Us'),
            backgroundColor:Colors.blue[900],
            foregroundColor:Colors.white,
            elevation: 0,
            leading: IconButton(
          icon: const Icon(Icons.arrow_back, color:Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
          ),

      backgroundColor: kWhiteColor,

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'assets/cre.webp',
                width: 200.0,
                height: 200.0,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Welcome to Creavers!',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            DescSection(
              text: "We provide long-standing experience for online teaching and learning by highly experienced instructors, for students who want to deepen their knowledge.",
              textStyle: textStyle.copyWith(fontStyle: FontStyle.italic),
            ),
            const DescSection(
              text: "School is live 24 hours every day with full tutoring, refresher courses for those in need. Online quizzes and exams. Pursue your academic and professional goals by taking online courses on a schedule that fits your convenience.",
              textStyle: textStyle,
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}