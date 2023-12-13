// ignore_for_file: avoid_print

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:creavers_project/splash_screen/onboarding.dart';
import 'package:creavers_project/constants/colors.dart';
import 'package:reactive_theme/reactive_theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final fcmToken = await FirebaseMessaging.instance.getToken();
  print (fcmToken);
  // Get the saved theme mode here
  final thememode = await ReactiveMode.getSavedThemeMode();

  // Run the app
  runApp(MyApp(savedThemeMode: thememode));
}

class MyApp extends StatelessWidget {
  final ThemeMode? savedThemeMode;

  const MyApp({Key? key, required this.savedThemeMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReactiveThemer(
      // loads the saved thememode.
      // If null, then ThemeMode.system is used
      savedThemeMode: savedThemeMode,
      builder: (reactiveMode) => MaterialApp(
        debugShowCheckedModeBanner: false,
        // Pass the reactiveMode to the themeMode parameter in order to toggle theme
        themeMode: reactiveMode,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          scaffoldBackgroundColor: AppColors.backgroundColor,
          appBarTheme: const AppBarTheme(color: AppColors.backgroundColor),
          primarySwatch: Colors.deepOrange,
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              brightness: Brightness.dark, seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Onboarding(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // Returns a boolean value
  ReactiveMode.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: const Center(),
    );
  }
}
