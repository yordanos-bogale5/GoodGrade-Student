// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationService {
  final CollectionReference _notificationsCollection =
      FirebaseFirestore.instance.collection('notifications');

  Future<void> sendNotification(String title, String message, String type, String recipientId) async {
    await _notificationsCollection.add({
      'title': title,
      'message': message,
      'timestamp': FieldValue.serverTimestamp(),
      'type': type,
      'recipientId': recipientId,
    });
  }

  Stream<QuerySnapshot> getNotifications(String userId) {
    return _notificationsCollection
        .where('recipientId', isEqualTo: userId)
        .snapshots();
  }

  void triggerNotification() async {
    // Instantiate NotificationService
    NotificationService _notificationService = NotificationService();

    await _notificationService.sendNotification(
      'New Course Available',
      'Check out our latest course!',
      'course_update',
      'user_id_here', // Replace with the actual user ID
    );
  }
}
