class NotificationModel {
  final String title;
  final String message;
  final DateTime timestamp;
  final String type;
  final String recipientId;

  NotificationModel({
    required this.title,
    required this.message,
    required this.timestamp,
    required this.type,
    required this.recipientId,
  });
}
