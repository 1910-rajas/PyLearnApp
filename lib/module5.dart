import 'package:flutter/material.dart';
import 'answers.dart';

class Mod5Page extends StatefulWidget {
  @override
  _HomeQuizState createState() => _HomeQuizState();
}

class _HomeQuizState extends State<Mod5Page> {
  List<Icon> _scoreTracker = [];
  int _questionIndex = 0;
  int _totalScore = 0;
  bool answerWasSelected = false;
  bool endofQuiz = false;
  bool correctAnswerSelected = false;

  void _questionAnswered(bool answerScore) {
    setState(() {
      answerWasSelected = true;
      if (answerScore) {
        _totalScore++;
        correctAnswerSelected = true;
      }
      _scoreTracker.add(
        answerScore
            ? Icon(
                Icons.check_circle,
                color: Colors.green,
              )
            : Icon(
                Icons.clear,
                color: Color.fromARGB(255, 255, 68, 0),
              ),
      );

      if (_questionIndex + 1 == _questions.length) {
        endofQuiz = true;
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      _questionIndex++;
      answerWasSelected = false;
      correctAnswerSelected = false;
      if (_questionIndex >= _questions.length) {
        _resetQuiz();
      }
    });
  }

  _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      _scoreTracker = [];
      endofQuiz = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Module 1 Quiz',
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                if (_scoreTracker.length == 0)
                  SizedBox(
                    height: 50.0,
                  ),
                if (_scoreTracker.length > 0) ..._scoreTracker
              ],
            ),
            Container(
              width: double.infinity,
              height: 150,
              margin: EdgeInsets.only(bottom: 10.0, left: 30, right: 30),
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 21, 21, 21),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black),
              ),
              child: Center(
                child: Text(
                  _questions[_questionIndex]['question'].toString(),
                  style: TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ...(_questions[_questionIndex]['answers']
                    as List<Map<String, dynamic>>)
                .map(
              (answer) => Answer(
                answerText: answer['answerText'].toString(),
                answerColor: answerWasSelected
                    ? answer['SCORE']
                        ? Colors.green
                        : Color.fromARGB(255, 228, 35, 21)
                    : null,
                answerTap: () {
                  if (answerWasSelected) {
                    return;
                  }
                  _questionAnswered(answer['SCORE']);
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 45),
              ),
              onPressed: () {
                if (!answerWasSelected) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        'Please Select an Answer before going to next Question!'),
                  ));
                  return;
                }
                _nextQuestion();
              },
              child: Text(
                endofQuiz ? 'Restart Quiz' : "Next Question",
              ),
            ),
            Container(
              padding: EdgeInsets.all(30),
              child: Text(
                '${_totalScore.toString()}/${_questions.length}',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            if (answerWasSelected)
              Container(
                height: 90,
                width: double.infinity,
                color: correctAnswerSelected
                    ? Colors.green
                    : Color.fromARGB(255, 253, 66, 53),
                child: Center(
                  child: Text(
                    correctAnswerSelected
                        ? 'Well Done! You got it right'
                        : 'Wrong!!',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

final _questions = const [
  {
    'question': '',
    'answers': [
      {'answerText': '', 'SCORE': true},
      {'answerText': '', 'SCORE': false},
      {'answerText': '', 'SCORE': false},
      {'answerText': '', 'SCORE': false},
    ],
  },
  {
    'question': '',
    'answers': [
      {'answerText': '', 'SCORE': true},
      {'answerText': '', 'SCORE': false},
      {'answerText': '', 'SCORE': false},
      {'answerText': '', 'SCORE': false},
    ],
  },
  {
    'question': '',
    'answers': [
      {'answerText': '', 'SCORE': true},
      {'answerText': '', 'SCORE': false},
      {'answerText': '', 'SCORE': false},
      {'answerText': '', 'SCORE': false},
    ],
  },
  {
    'question': '',
    'answers': [
      {'answerText': '', 'SCORE': true},
      {'answerText': '', 'SCORE': false},
      {'answerText': '', 'SCORE': false},
      {'answerText': '', 'SCORE': false},
    ],
  },
  {
    'question': '',
    'answers': [
      {'answerText': '', 'SCORE': true},
      {'answerText': '', 'SCORE': false},
      {'answerText': '', 'SCORE': false},
      {'answerText': '', 'SCORE': false},
    ],
  },
  {
    'question': '',
    'answers': [
      {'answerText': '', 'SCORE': true},
      {'answerText': '', 'SCORE': false},
      {'answerText': '', 'SCORE': false},
      {'answerText': '', 'SCORE': false},
    ],
  },
  {
    'question': '',
    'answers': [
      {'answerText': '', 'SCORE': true},
      {'answerText': '', 'SCORE': false},
      {'answerText': '', 'SCORE': false},
      {'answerText': '', 'SCORE': false},
    ],
  },
  {
    'question': '',
    'answers': [
      {'answerText': '', 'SCORE': true},
      {'answerText': '', 'SCORE': false},
      {'answerText': '', 'SCORE': false},
      {'answerText': '', 'SCORE': false},
    ],
  },
  {
    'question': '',
    'answers': [
      {'answerText': '', 'SCORE': true},
      {'answerText': '', 'SCORE': false},
      {'answerText': '', 'SCORE': false},
      {'answerText': '', 'SCORE': false},
    ],
  },
  {
    'question': '',
    'answers': [
      {'answerText': '', 'SCORE': true},
      {'answerText': '', 'SCORE': false},
      {'answerText': '', 'SCORE': false},
      {'answerText': '', 'SCORE': false},
    ],
  },
  {
    'question': '',
    'answers': [
      {'answerText': '', 'SCORE': true},
      {'answerText': '', 'SCORE': false},
      {'answerText': '', 'SCORE': false},
      {'answerText': '', 'SCORE': false},
    ],
  },
  {
    'question': '',
    'answers': [
      {'answerText': '', 'SCORE': true},
      {'answerText': '', 'SCORE': false},
      {'answerText': '', 'SCORE': false},
      {'answerText': '', 'SCORE': false},
    ],
  },
  {
    'question': '',
    'answers': [
      {'answerText': '', 'SCORE': true},
      {'answerText': '', 'SCORE': false},
      {'answerText': '', 'SCORE': false},
      {'answerText': '', 'SCORE': false},
    ],
  },
  {
    'question': '',
    'answers': [
      {'answerText': '', 'SCORE': true},
      {'answerText': '', 'SCORE': false},
      {'answerText': '', 'SCORE': false},
      {'answerText': '', 'SCORE': false},
    ],
  },
  {
    'question': '',
    'answers': [
      {'answerText': '', 'SCORE': true},
      {'answerText': '', 'SCORE': false},
      {'answerText': '', 'SCORE': false},
      {'answerText': '', 'SCORE': false},
    ],
  },
  {
    'question': '',
    'answers': [
      {'answerText': '', 'SCORE': true},
      {'answerText': '', 'SCORE': false},
      {'answerText': '', 'SCORE': false},
      {'answerText': '', 'SCORE': false},
    ],
  },
  {
    'question': '',
    'answers': [
      {'answerText': '', 'SCORE': true},
      {'answerText': '', 'SCORE': false},
      {'answerText': '', 'SCORE': false},
      {'answerText': '', 'SCORE': false},
    ],
  },
  {
    'question': '',
    'answers': [
      {'answerText': '', 'SCORE': true},
      {'answerText': '', 'SCORE': false},
      {'answerText': '', 'SCORE': false},
      {'answerText': '', 'SCORE': false},
    ],
  },
  {
    'question': '',
    'answers': [
      {'answerText': '', 'SCORE': true},
      {'answerText': '', 'SCORE': false},
      {'answerText': '', 'SCORE': false},
      {'answerText': '', 'SCORE': false},
    ],
  },
  {
    'question': '',
    'answers': [
      {'answerText': '', 'SCORE': true},
      {'answerText': '', 'SCORE': false},
      {'answerText': '', 'SCORE': false},
      {'answerText': '', 'SCORE': false},
    ],
  },
];
