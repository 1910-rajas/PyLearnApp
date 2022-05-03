import 'package:flutter/material.dart';
import 'package:python_app1/answers.dart';

class Mod2Page extends StatefulWidget {
  @override
  _HomeQuizState createState() => _HomeQuizState();
}

class _HomeQuizState extends State<Mod2Page> {
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
      // _scoreTracker.add(
      //   answerScore
      //       ? Icon(
      //           Icons.check_circle,
      //           color: Colors.green,
      //         )
      //       : Icon(
      //           Icons.clear,
      //           color: Color.fromARGB(255, 255, 68, 0),
      //         ),
      // );

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
          'Module 2 Quiz',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  if (_scoreTracker.length == 0)
                    SizedBox(
                      height: 20.0,
                    ),
                  if (_scoreTracker.length > 0) ..._scoreTracker
                ],
              ),
              Container(
                width: double.infinity,
                height: 250,
                margin: EdgeInsets.only(bottom: 10.0, left: 30, right: 30),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 63, 65, 68),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black),
                ),
                child: Center(
                  child: Text(
                    _questions[_questionIndex]['question'].toString(),
                    style: TextStyle(
                      fontSize: 26,
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
                          : Color.fromARGB(255, 253, 109, 109)
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
                  style: TextStyle(fontSize: 27),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Score : ${_totalScore.toString()}/${_questions.length}',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
              if (answerWasSelected)
                Container(
                  height: 50,
                  width: 400,
                  color: correctAnswerSelected
                      ? Colors.green
                      : Color.fromARGB(255, 253, 109, 109),
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
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final _questions = const [
  {
    'question': ' What is the maximum possible length of an identifier?',
    'answers': [
      {'answerText': '31 characters', 'SCORE': false},
      {'answerText': '63 characters', 'SCORE': false},
      {'answerText': '79 characters', 'SCORE': false},
      {'answerText': 'none of the mentioned', 'SCORE': true},
    ],
  },
  {
    'question': ' Which of the following is invalid?',
    'answers': [
      {'answerText': '_a = 1', 'SCORE': false},
      {'answerText': '__a = 1', 'SCORE': false},
      {'answerText': '__str__ = 1', 'SCORE': false},
      {'answerText': ' none of the mentioned', 'SCORE': true},
    ],
  },
  {
    'question': 'Which of the following is true for variable names in Python?',
    'answers': [
      {'answerText': 'Unlimited length', 'SCORE': true},
      {
        'answerText':
            'all private members must have leading and trailing underscores',
        'SCORE': false
      },
      {
        'answerText':
            'underscore and ampersand are the only two special characters allowed',
        'SCORE': false
      },
      {'answerText': 'none of the mentioned', 'SCORE': false},
    ],
  },
  {
    'question': 'Which of the following is an invalid statement?',
    'answers': [
      {'answerText': 'abc = 1,000,000', 'SCORE': true},
      {'answerText': 'a b c = 1000 2000 3000', 'SCORE': false},
      {'answerText': 'a,b,c = 1000, 2000, 3000', 'SCORE': false},
      {'answerText': ' a_b_c = 1,000,000', 'SCORE': false},
    ],
  },
  {
    'question': 'HERE GOES QUES',
    'answers': [
      {'answerText': 'OPTION', 'SCORE': true},
      {'answerText': 'OPTION', 'SCORE': false},
      {'answerText': 'OPTION', 'SCORE': false},
      {'answerText': 'OPTION', 'SCORE': false},
    ],
  },
  {
    'question': 'Which of the following cannot be a variable?',
    'answers': [
      {'answerText': '__init__', 'SCORE': false},
      {'answerText': 'in', 'SCORE': true},
      {'answerText': 'it', 'SCORE': false},
      {'answerText': 'on', 'SCORE': false},
    ],
  },
  {
    'question': ' Which is the correct operator for power(xy)?',
    'answers': [
      {'answerText': 'X^y', 'SCORE': false},
      {'answerText': ' X**y', 'SCORE': true},
      {'answerText': 'X^^y', 'SCORE': false},
      {'answerText': ' None of the mentioned', 'SCORE': false},
    ],
  },
  {
    'question': 'Which one of these is floor division?',
    'answers': [
      {'answerText': '/', 'SCORE': false},
      {'answerText': '//', 'SCORE': true},
      {'answerText': '%', 'SCORE': false},
      {'answerText': 'None of above', 'SCORE': false},
    ],
  },
  {
    'question': 'What is the answer to this expression, 22 % 3 is?',
    'answers': [
      {'answerText': '7', 'SCORE': false},
      {'answerText': '1', 'SCORE': true},
      {'answerText': '0', 'SCORE': false},
      {'answerText': '5', 'SCORE': false},
    ],
  },
  {
    'question':
        'Operators with the same precedence are evaluated in which manner?',
    'answers': [
      {'answerText': 'Left to Right', 'SCORE': true},
      {'answerText': 'Right to Left', 'SCORE': false},
      {'answerText': 'Can’t say', 'SCORE': false},
      {'answerText': ' None of the mentioned', 'SCORE': false},
    ],
  },
  {
    'question': ' Which one of the following has the same precedence level?',
    'answers': [
      {'answerText': ' Addition and Subtraction', 'SCORE': true},
      {'answerText': 'Multiplication, Division and Addition', 'SCORE': false},
      {
        'answerText': 'Multiplication, Division, Addition and Subtraction',
        'SCORE': false
      },
      {'answerText': 'Addition and Multiplication', 'SCORE': false},
    ],
  },
  {
    'question': ' Which of the following is not used as loop in Python?',
    'answers': [
      {'answerText': 'for loop', 'SCORE': false},
      {'answerText': 'while loop', 'SCORE': false},
      {'answerText': 'do-while loop', 'SCORE': true},
      {'answerText': 'None of the above', 'SCORE': false},
    ],
  },
  {
    'question': 'Which of the following is False regarding loops in Python?',
    'answers': [
      {
        'answerText': 'Loops are used to perform certain tasks repeatedly.',
        'SCORE': false
      },
      {
        'answerText':
            'While loop is used when multiple statements are to executed repeatedly until the given condition becomes False',
        'SCORE': true
      },
      {
        'answerText':
            'While loop is used when multiple statements are to executed repeatedly until the given condition becomes True.',
        'SCORE': false
      },
      {
        'answerText':
            'for loop can be used to iterate through the elements of lists.',
        'SCORE': false
      },
    ],
  },
  {
    'question': 'Which one of the following is a valid Python if statement :',
    'answers': [
      {'answerText': ' if a>=2 :', 'SCORE': true},
      {'answerText': ' if (a >= 2)', 'SCORE': false},
      {'answerText': ' if (a => 22)', 'SCORE': false},
      {'answerText': ' if a >= 22', 'SCORE': false},
    ],
  },
  {
    'question':
        'What keyword would you use to add an alternative condition to an if statement?',
    'answers': [
      {'answerText': 'else if', 'SCORE': true},
      {'answerText': ' elseif', 'SCORE': false},
      {'answerText': ' elif', 'SCORE': false},
      {'answerText': ' None of the above', 'SCORE': false},
    ],
  },
  {
    'question': 'Can we write if/else into one line in python?',
    'answers': [
      {'answerText': 'Yes', 'SCORE': true},
      {'answerText': 'No', 'SCORE': false},
      {'answerText': 'if/else not used in python', 'SCORE': false},
      {'answerText': 'None of the above', 'SCORE': false},
    ],
  },
  {
    'question': ' Which statement will check if a is equal to b?',
    'answers': [
      {'answerText': 'if a = b:', 'SCORE': false},
      {'answerText': 'if a == b:', 'SCORE': true},
      {'answerText': 'if a === c:', 'SCORE': false},
      {'answerText': ' if a == b', 'SCORE': false},
    ],
  },
  {
    'question': 'Does python have switch case statement?',
    'answers': [
      {'answerText': 'True', 'SCORE': false},
      {'answerText': 'False', 'SCORE': true},
      {
        'answerText': 'Python has switch statement but we can not use it.',
        'SCORE': false
      },
      {'answerText': 'None of the above', 'SCORE': false},
    ],
  },
  {
    'question':
        'A loop becomes infinite loop if a condition never becomes______?',
    'answers': [
      {'answerText': ' TRUE', 'SCORE': false},
      {'answerText': 'Both A and C', 'SCORE': false},
      {'answerText': 'Null', 'SCORE': false},
      {'answerText': 'FALSE', 'SCORE': true},
    ],
  },
  {
    'question': 'The continue statement can be used in?',
    'answers': [
      {'answerText': ' while loop', 'SCORE': false},
      {'answerText': ' for loop', 'SCORE': false},
      {'answerText': ' do-while', 'SCORE': false},
      {'answerText': ' Both A and B', 'SCORE': true},
    ],
  },
];
