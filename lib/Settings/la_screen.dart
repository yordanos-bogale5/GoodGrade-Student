// language_screen.dart
import 'package:flutter/material.dart';

import 'language_utils.dart.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _changeLanguage(context, 'French');
          },
          child: const Text('Change Language'),
        ),
      ),
    );
  }

  Future<void> _changeLanguage(BuildContext context, String language) async {
    await LanguageUtils.setLanguage(language);
    // You might want to rebuild your widget tree to apply the language changes
    // For example, you could use a StatefulWidget and call setState
  }
}
