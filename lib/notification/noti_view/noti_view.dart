// ignore_for_file: library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../service/noti_service.dart';

class NotificationScreen extends StatefulWidget {
  final String userId;

  const NotificationScreen({super.key, required this.userId});

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final NotificationService _notificationService = NotificationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: StreamBuilder(
        stream: _notificationService.getNotifications(widget.userId),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            // Display the notifications
            List<QueryDocumentSnapshot> notifications = snapshot.data!.docs;
            return ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                var notification = notifications[index];
                return ListTile(
                  title: Text(notification['title']),
                  subtitle: Text(notification['message']),
                  // Add more details if needed
                );
              },
            );
          }
        },
      ),
    );
  }
}

class NotiAdminDashboard extends StatelessWidget {
  final String adminUserId = 'admin_user_id_here';

   NotiAdminDashboard({super.key}); // Replace with actual admin user ID

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NotificationScreen(
                  userId: adminUserId,
                ),
              ),
            );
          },
          child: const Text('View Notifications'),
        ),
      ),
    );
  }
}

class InstructorDashboard extends StatelessWidget {
  final String instructorUserId = 'instructor_user_id_here';

  const InstructorDashboard({super.key}); // Replace with actual instructor user ID

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instructor Dashboard'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NotificationScreen(
                  userId: instructorUserId,
                ),
              ),
            );
          },
          child: const Text('View Notifications'),
        ),
      ),
    );
  }
}

class StudentDashboard extends StatelessWidget {
  final String studentUserId = 'student_user_id_here';

  const StudentDashboard({super.key}); // Replace with actual student user ID

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Dashboard'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NotificationScreen(
                  userId: studentUserId,
                ),
              ),
            );
          },
          child: const Text('View Notifications'),
        ),
      ),
    );
  }
}
