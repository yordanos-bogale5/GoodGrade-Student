// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../adimin_dashboard/dashboard.dart';
import '../courses/detail.dashboard.dart';

import '../instructor_dashboard/inst_dash.dart';
import 'custombtn.dart';
import 'forget_password.dart';
import 'google_sign_in.dart';
import 'sign_up.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  bool rememberMe = false;

  Future<void> loginUser() async {
    try {
      setState(() {
        isLoading = true;
      });

      // Check if the user is an instructor
      bool isInstructor = await checkIfInstructor(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      // Check if the user is an admin
      bool isAdmin = await checkIfAdmin(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      if (isInstructor) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const InstDashboard(),
          ),
        );
      } else if (isAdmin) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AdminDashboard(),
          ),
        );
      } else {
        // If not an instructor or admin, attempt Firebase Authentication
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        User? user = userCredential.user;

        if (user != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DetailCourseScreen(),
            ),
          );
        }
      }
    } catch (e) {
      print("Error logging in: $e");
      // If you want to display an error message to the user, you can do so here.
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<bool> checkIfInstructor(String email, String password) async {
    try {
      // Check if the user exists in the 'instructors' collection in Firestore
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
          .collection('instructors')
          .where('email', isEqualTo: email)
          .where('password', isEqualTo: password)
          .get();

      return snapshot.docs.isNotEmpty;
    } catch (e) {
      print("Error checking instructor: $e");
      return false;
    }
  }

Future<bool> checkIfAdmin(String email, String password) async {
  try {
    // Check if the user exists in the 'Admin' collection in Firestore
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
        .collection('Admin')
        .where('email', isEqualTo: email)
        .where('password', isEqualTo: password)
        .get();

    return snapshot.docs.isNotEmpty;
  } catch (e) {
    print("Error checking admin: $e");
    return false;
  }
}


  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Have An Account  ?'),
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/cre.webp',
                  width: 100.0,
                  height: 100.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 148.0),
                  child: Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 32,
                      color: Color(0xFF808080),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                const SizedBox(height: 26.0),
                ElevatedButton.icon(
                  onPressed: isLoading
                      ? null
                      : () async {
                          setState(() {
                            isLoading = true;
                          });

                          try {
                            await GoogleFirebaseServices().signInWithGoogle();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DetailCourseScreen(),
                              ),
                            );
                          } catch (e) {
                            print('Error during Google sign in: $e');
                          } finally {
                            setState(() {
                              isLoading = false;
                            });
                          }
                        },
                  icon: Image.asset(
                    'assets/google-logo-hd.png',
                    width: 24.0,
                    height: 24.0,
                  ),
                  label: Text(
                    isLoading ? 'Logging In...' : 'Continue with Google',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 94.0,
                    ),
                  ),
                ),
                const SizedBox(height: 26.0),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        height: 0,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'or',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        height: 0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 14.0, horizontal: 12.0),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(value)) {
                      return 'Invalid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 26.0),
                TextFormField(
                  controller: passwordController,
                  obscureText: !isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 14.0, horizontal: 16.0),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Checkbox(
                      value: rememberMe,
                      onChanged: (value) {
                        setState(() {
                          rememberMe = value ?? false;
                        });
                      },
                    ),
                    const Text(
                      'Remember Me',
                      style: TextStyle(
                        color: Color.fromARGB(255, 26, 184, 31),
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 60.0),
                    _buildForgotPasswordText(),
                  ],
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () async {
                          if (_formKey.currentState?.validate() ?? false) {
                            await loginUser();
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue[900],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 44.0),
                  ),
                  child: Text(
                    isLoading ? 'Logging In...' : 'Log In',
                    style: const TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
                if (isLoading)
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(),
                  ),
                const SizedBox(height: 16.0),
                _buildCreateAccountButton(MediaQuery.of(context)
                    .size
                    .width),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForgotPasswordText() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ForgotPasswordView(),
          ),
        );
      },
      child: const Text(
        "Forgotten password?",
        style: TextStyle(color: Colors.red, fontSize: 16),
      ),
    );
  }

  Widget _buildCreateAccountButton(double width) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SignUpScreen(),
          ),
        );
      },
      child: CustomBtn(
        width: width * 0.8,
        text: "Create Account",
        btnColor: Colors.blue[900],
        btnTextColor: Colors.white,
      ),
    );
  }
}
