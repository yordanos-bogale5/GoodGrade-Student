// authentication_service.dart
// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'user_model.dart';

class AuthService {
  final firebase_auth.FirebaseAuth _auth = firebase_auth.FirebaseAuth.instance;


  Stream<firebase_auth.User?> get user => _auth.authStateChanges();

  Future<Users?> signInWithEmailAndPassword(String email, String password) async {
    try {
      firebase_auth.UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return _userFromFirebaseUser(userCredential.user);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Users? _userFromFirebaseUser(firebase_auth.User? user) {
    if (user == null) return null;

    String role = determineRole(user.email);

    return Users(uid: user.uid, email: user.email!, role: role);
  }

  String determineRole(String? email) {
    if (email == null) return "unknown";


    if (email.endsWith("admin@gmail.com")) {
      return "admin";
    } else if (email.endsWith("instructor@gmail.com")) {
      return "instructor";
    } else {
      return "student";
    }
  }
}
