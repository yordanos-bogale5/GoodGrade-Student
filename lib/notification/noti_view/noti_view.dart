import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() {
  runApp(MyApp());
}

class PushNotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    // Request permission for iOS devices
    NotificationSettings settings =
        await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');

    // Handle incoming messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Foreground Message received: ${message.notification?.body}");
      // Handle the incoming message while the app is in the foreground
      _handleMessage(message);
    });

    // Handle messages when the app is in the background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("Background Message clicked: ${message.notification?.body}");
      // Handle the incoming message when the app is opened from the background
      _handleMessage(message);
    });

    // Check if the app was opened by a notification
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      print("App opened by notification: ${initialMessage.notification?.body}");
      _handleMessage(initialMessage);
    }

    // Initialize flutter_local_notifications
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> _handleMessage(RemoteMessage message) async {
    // Display the notification
    await _showNotification(
        message.notification?.title ?? 'Notification',
        message.notification?.body ?? '');

    // Implement your custom logic to handle the notification message
    // For example, you can update the UI, navigate to a specific screen, etc.
    MyApp.updateMessage(message.notification?.body ?? "No new notifications");
  }

Future<void> _showNotification(String title, String body) async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'your channel id', // Replace with your channel ID
    'your channel name', // Replace with your channel name
     // Replace with your channel description
    importance: Importance.max,
    priority: Priority.high,
  );
  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);
  await _flutterLocalNotificationsPlugin.show(
    0,
    title,
    body,
    platformChannelSpecifics,
    payload: 'item x',
  );
}

}

class MyApp extends StatelessWidget {
  static String notificationMessage = "No new notifications";

  static void updateMessage(String message) {
    notificationMessage = message;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Push Notifications',
      home: NotificationScreen(),
    );
  }
}

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();
    PushNotificationService().init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification Screen"),
      ),
      body: Center(
        child: Text(MyApp.notificationMessage),
      ),
    );
  }
}
