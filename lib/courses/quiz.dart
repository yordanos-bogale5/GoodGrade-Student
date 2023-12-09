// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: QuizApp(),
  ));
}

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _quizCompleted = false;

  final List<Question> _questions = [
    Question(
      'What is the capital of France?',
      ['Berlin', 'Paris', 'Madrid', 'Rome'],
      1,
    ),
    Question(
      'Which programming language is Flutter based on?',
      ['Java', 'Dart', 'Python', 'C#'],
      1,
    ),
    Question(
      'What is the largest planet in our solar system?',
      ['Earth', 'Jupiter', 'Mars', 'Venus'],
      1,
    ),
    Question(
      'What is the currency of Japan?',
      ['Yuan', 'Won', 'Yen', 'Ringgit'],
      2,
    ),
    Question(
      'Which country is known as the Land of the Rising Sun?',
      ['China', 'Japan', 'Korea', 'Vietnam'],
      1,
    ),
    Question(
      'In what year did the Titanic sink?',
      ['1905', '1912', '1920', '1933'],
      1,
    ),
    Question(
      'What is the largest ocean on Earth?',
      ['Atlantic', 'Indian', 'Arctic', 'Pacific'],
      3,
    ),
    Question(
      'Who painted the Mona Lisa?',
      ['Van Gogh', 'Leonardo da Vinci', 'Picasso', 'Rembrandt'],
      1,
    ),
    Question(
      'Which planet is known as the Red Planet?',
      ['Earth', 'Mars', 'Venus', 'Jupiter'],
      1,
    ),
    Question(
      'What is the capital of Australia?',
      ['Sydney', 'Melbourne', 'Canberra', 'Brisbane'],
      2,
    ),
  ];

  void _checkAnswer(int selectedOption) {
    if (!_quizCompleted) {
      if (_questions[_currentQuestionIndex].correctAnswerIndex == selectedOption) {
        setState(() {
          _score++;
        });
      }

      if (_currentQuestionIndex < _questions.length - 1) {
        setState(() {
          _currentQuestionIndex++;
        });
      } else {
        setState(() {
          _quizCompleted = true;
        });
      }
    }
  }

  void _resetQuiz() {
    setState(() {
      _currentQuestionIndex = 0;
      _score = 0;
      _quizCompleted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Quiz '),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              _quizCompleted
                  ? 'Quiz Completed!'
                  : 'Question ${_currentQuestionIndex + 1}/${_questions.length}',
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 10.0),
            _quizCompleted
                ? Text(
                    'Your Final Score: $_score out of ${_questions.length}',
                    style: const TextStyle(fontSize: 24.0),
                  )
                : Text(
                    _questions[_currentQuestionIndex].questionText,
                    style: const TextStyle(fontSize: 24.0),
                  ),
            const SizedBox(height: 20.0),
            if (!_quizCompleted)
              ..._questions[_currentQuestionIndex].options
                  .asMap()
                  .entries
                  .map(
                    (entry) => ElevatedButton(
                      onPressed: () => _checkAnswer(entry.key),
                      child: Text(entry.value),
                    ),
                  )
                  .toList(),
            if (_quizCompleted)
              ElevatedButton(
                onPressed: _resetQuiz,
                child: const Text('Restart Quiz'),
              ),
            const SizedBox(height: 20.0),
            if (!_quizCompleted)
              Text(
                'Score: $_score',
                style: const TextStyle(fontSize: 18.0),
              ),
          ],
        ),
      ),
    );
  }
}

class Question {
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;

  Question(this.questionText, this.options, this.correctAnswerIndex);
}
