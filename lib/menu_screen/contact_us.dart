// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

void main() => runApp(const ContactUs());

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final toMailController = TextEditingController();
  final subjectController = TextEditingController();
  final textController = TextEditingController();

  Future<void> sendMail() async {
    String username = ''; // Your Email
    String password = ''; // Your Email Password

    // Create Gmail Server
    final smtpServer = gmail(username, password);

    // Create Gmail Message
    final message = Message()
      ..from = Address(username)
      ..recipients.add(toMailController.text)
      //..ccRecipients.addAll(['abc@gmail.com','pqr@gmail.com','...'])
      //..bccRecipients.add('...')
      ..subject = subjectController.text
      ..text = textController.text;

    try {
      final sendReport = await send(message, smtpServer);
      print('Message Sent: $sendReport');
      clear();
    } catch (e) {
      print('Message not sent: $e');
    }
  }

  void clear() {
    toMailController.text = '';
    subjectController.text = '';
    textController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner:false,
      title: 'Contact Us',

      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mail Send'),
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
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                TextFormField(
                  controller: toMailController,
                  decoration: const InputDecoration(
                    hintText: 'Please Enter To Mail Address',
                    labelText: 'To Mail',
                  ),
                ),
                TextFormField(
                  controller: subjectController,
                  decoration: const InputDecoration(
                    hintText: 'Please Enter Subject',
                    labelText: 'Subject',
                  ),
                ),
                TextFormField(
                  controller: textController,
                  decoration: const InputDecoration(
                    hintText: 'Please Enter Text',
                    labelText: 'Text',
                  ),
                  minLines: 5,
                  maxLines: 8,
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton.icon(
                        onPressed: sendMail,
                        icon: const Icon(Icons.send),
                        label: const Text('Send'),
                      ),
                      TextButton.icon(
                        onPressed: clear,
                        icon: const Icon(Icons.clear),
                        label: const Text('Clear'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Card(
                  elevation: 2,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Contact info:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.location_on),
                            SizedBox(width: 5),
                            Text(
                              'Postal Address:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'PO Box Bole Medhanealem, Abyssina Building 3rd floor',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Divider(), // Add a line
                        Row(
                          children: [
                            Icon(Icons.phone),
                            SizedBox(width: 5),
                            Text(
                              'Phone:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '251-116-674192 | 62',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Divider(), // Add a line
                        Row(
                          children: [
                            Icon(Icons.email),
                            SizedBox(width: 5),
                            Text(
                              'Email:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'contact@creavers.com',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Divider(), // Add a line
                        Row(
                          children: [
                            Icon(Icons.public),
                            SizedBox(width: 5),
                            Text(
                              'Web:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'creavers.com',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Divider(),
                        Row(
                          children: [
                            Icon(Icons.chat),
                            SizedBox(width: 5),
                            Text(
                              'Skype:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Creavers',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
