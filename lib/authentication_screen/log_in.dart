import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../courses/detail.dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> loginUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Get the signed-in user
      User? user = userCredential.user;

      if (user != null) {
        // Navigate to the DetailCourseScreen and pass the user details
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DetailCourseScreen(),
          ),
        );
      }
    } catch (e) {
      print("Error logging in: $e");
      // Handle login error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          title: const Text('Have An Account  ?'),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
                  'assets/cre.webp',
                  width: 100.0,
                  height: 100.0,
                ),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                icon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                icon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                loginUser();
              },
              child: const Text('Log In'),
            ),
          ],
        ),
      ),
    );
  }
}
