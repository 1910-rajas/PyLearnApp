import 'package:flutter/material.dart';
import 'package:python_app1/answers.dart';

class Mod1Page extends StatefulWidget {
  @override
  _HomeQuizState createState() => _HomeQuizState();
}

class _HomeQuizState extends State<Mod1Page> {
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

const _questions = const [
  {
    'question': 'Who invented Python?',
    'answers': [
      {'answerText': 'Tom Rogers', 'SCORE': false},
      {'answerText': 'Jack Dsouza', 'SCORE': false},
      {'answerText': 'Bill Gates', 'SCORE': false},
      {'answerText': 'Guido van Rossum', 'SCORE': true},
    ],
  },
  {
    'question': 'Identify incorrect statement about Python?',
    'answers': [
      {'answerText': 'Easy-to-learn', 'SCORE': false},
      {'answerText': 'Easy-to-read', 'SCORE': false},
      {'answerText': 'Difficuit to Maintain', 'SCORE': true},
      {'answerText': 'Portable', 'SCORE': false},
    ],
  },
  {
    'question': 'Python is : ',
    'answers': [
      {'answerText': 'Object-Oriented', 'SCORE': true},
      {'answerText': 'Non Interactive', 'SCORE': false},
      {'answerText': 'Un interpreted', 'SCORE': false},
      {'answerText': 'Difficuilt for Beginners', 'SCORE': false},
    ],
  },
  {
    'question': 'Which variable is named as PATH in Unix?',
    'answers': [
      {'answerText': 'paths', 'SCORE': false},
      {'answerText': 'Path', 'SCORE': false},
      {'answerText': 'PATH', 'SCORE': true},
      {'answerText': 'PATHS', 'SCORE': false},
    ],
  },
  {
    'question':
        'Which one contains Path of an Initialization file containing Python Source Code?',
    'answers': [
      {'answerText': 'PYTHONSTARTUP', 'SCORE': true},
      {'answerText': 'PYTHONHOME', 'SCORE': false},
      {'answerText': 'PYTHONCASEOK ', 'SCORE': false},
      {'answerText': 'PYTHONPATH', 'SCORE': false},
    ],
  },
  {
    'question': 'Which sign is used to comment lines in Python?',
    'answers': [
      {'answerText': '%', 'SCORE': false},
      {'answerText': '#', 'SCORE': true},
      {'answerText': '/*--- */', 'SCORE': false},
      {'answerText': '//', 'SCORE': false},
    ],
  },
  {
    'question': 'Which one multiple symbols on single line in Python?',
    'answers': [
      {'answerText': ';', 'SCORE': true},
      {'answerText': ':', 'SCORE': false},
      {'answerText': ',', 'SCORE': false},
      {'answerText': '@', 'SCORE': false},
    ],
  },
  {
    'question': 'Which of these in not a core data type?',
    'answers': [
      {'answerText': 'Lists', 'SCORE': false},
      {'answerText': 'Dictionary', 'SCORE': false},
      {'answerText': 'Tuples', 'SCORE': false},
      {'answerText': 'Class', 'SCORE': true},
    ],
  },
  {
    'question':
        '"apple = mango" What error occurs when you execute the following Python code snippet?',
    'answers': [
      {'answerText': 'SyntaxError', 'SCORE': false},
      {'answerText': 'NameError', 'SCORE': true},
      {'answerText': 'ValueError', 'SCORE': false},
      {'answerText': 'TypeError', 'SCORE': false},
    ],
  },
];
