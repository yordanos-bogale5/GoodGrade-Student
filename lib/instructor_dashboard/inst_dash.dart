import 'package:flutter/material.dart';
import 'add_answer.dart';
import 'add_assignment.dart';
import 'add_cours.dart';
import 'add_quiz.dart';

void main() {
  runApp(const InstDashboard());
}

class InstDashboard extends StatelessWidget {
  const InstDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: () async {
          // Handle back button press
          print('Back button pressed');
          return true; // Return true to allow back navigation
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Instructor Dashboard'),
            backgroundColor: Colors.blue[900],
            foregroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {
                  // Show notifications screen
                  _goToNotificationScreen(context);
                },
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  // Show send message screen
                  _goToSendMessageScreen(context);
                },
              ),
            ],
          ),
          body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 7.0,
              mainAxisSpacing: 0.0,
            ),
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              List<String> texts = [
                'Add Courses ',
                'Add Quiz',
                'Add  Answer',
                'Add Assignment',
              ];

              return InkWell(
                onTap: () {
                  print('Tapped on card ${index + 1}');
                  switch (index) {
                    case 0:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddCourses(),
                        ),
                      );
                      break;
                    case 1:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const InstAddQuiz(),
                        ),
                      );
                      break;
                    case 2:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizAnswerUploader(),
                        ),
                      );
                      break;
                    case 3:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Assignment(),
                        ),
                      );
                      break;
                    default:
                      break;
                  }
                },
                child: Card(
                  elevation: 4.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        texts[index],
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _goToNotificationScreen(BuildContext context) {
    // Navigate to the screen for viewing notifications
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NotificationScreen(),
      ),
    );
  }

  void _goToSendMessageScreen(BuildContext context) {
    // Navigate to the screen for sending messages
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SendMessageScreen(),
      ),
    );
  }
}

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: Center(
        child: const Text('View your notifications here.'),
      ),
    );
  }
}

class SendMessageScreen extends StatefulWidget {
  const SendMessageScreen({Key? key}) : super(key: key);

  @override
  _SendMessageScreenState createState() => _SendMessageScreenState();
}

class _SendMessageScreenState extends State<SendMessageScreen> {
  final TextEditingController _messageController = TextEditingController();

  void _sendMessage() {
    // Implement logic to send the message
    final String message = _messageController.text;
    // Add your logic to send the message
    print('Sending message: $message');
    // You can implement the actual sending functionality here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Message'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _messageController,
              decoration: const InputDecoration(
                labelText: 'Message',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _sendMessage,
              child: const Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}
