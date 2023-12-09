import 'package:flutter/material.dart';



import '../constants/constant.dart';



class Chat extends StatefulWidget {
  const Chat({required Key key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Chat '),
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
      backgroundColor: kWhiteColor,
   
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            flex: 1,
            child: EmptySection(
              imgPath: 'assets/cre.webp',
              emptyMsg: "No message yet",
              key: Key('EmptySectionKey'),
            ),
          ),
          Expanded(
            flex: 0,
            child: Material(
              elevation: kLess,
              color: kWhiteColor,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: kLess),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: kPrimaryColor,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin:
                            const EdgeInsets.symmetric(horizontal: kLess),
                        padding: const EdgeInsets.symmetric(
                            horizontal: kLessPadding),
                        decoration: BoxDecoration(
                          border: Border.all(color: kAccentColor),
                          color: kWhiteColor,
                        ),
                        child: const TextField(
                          cursorColor: kPrimaryColor,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter some text to send a message",
                            hintStyle: TextStyle(color: kLightColor),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.email,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class EmptySection extends StatelessWidget {
  final String imgPath;
  final String emptyMsg;

  const EmptySection({
    required this.imgPath,
    required this.emptyMsg,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imgPath,
          width: 120,
          height: 120,
        ),
        const SizedBox(height: 16),
        Text(
          emptyMsg,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}