import 'package:flutter/material.dart';
import 'answers.dart';

class Mod3Page extends StatefulWidget {
  @override
  _HomeQuizState createState() => _HomeQuizState();
}

class _HomeQuizState extends State<Mod3Page> {
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
          'Module 3 Quiz',
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
    'question': 'Number data types store?',
    'answers': [
      {'answerText': 'Octal values', 'SCORE': false},
      {'answerText': 'Binary values', 'SCORE': false},
      {'answerText': 'Hexadecimal Values', 'SCORE': false},
      {'answerText': 'Numeric values', 'SCORE': true},
    ],
  },
  {
    'question': 'Number Data Types are of which type?',
    'answers': [
      {'answerText': 'Mutable', 'SCORE': false},
      {'answerText': 'Immutable', 'SCORE': true},
      {'answerText': 'Sometimes Mutable', 'SCORE': false},
      {'answerText': 'None of the above', 'SCORE': false},
    ],
  },
  {
    'question': 'Number objects are created when you assign_____?',
    'answers': [
      {'answerText': 'A Unit', 'SCORE': false},
      {'answerText': 'A quantity', 'SCORE': false},
      {'answerText': 'A Value', 'SCORE': true},
      {'answerText': 'None of the Above', 'SCORE': false},
    ],
  },
  {
    'question': 'Choose incorrect Numerical type in Python',
    'answers': [
      {'answerText': 'int', 'SCORE': false},
      {'answerText': 'float', 'SCORE': false},
      {'answerText': 'complex', 'SCORE': false},
      {'answerText': 'string', 'SCORE': true},
    ],
  },
  {
    'question': 'acos(x) : Return the arc cosine of x, in radians',
    'answers': [
      {'answerText': 'True', 'SCORE': true},
      {'answerText': 'False', 'SCORE': false},
      // {'answerText': '', 'SCORE': false},
      // {'answerText': '', 'SCORE': false},
    ],
  },
  {
    'question': 'How many Trigonometric Functions does python support?',
    'answers': [
      {'answerText': '12', 'SCORE': false},
      {'answerText': '4', 'SCORE': false},
      {'answerText': '3', 'SCORE': false},
      {'answerText': '10', 'SCORE': true},
    ],
  },
  {
    'question':
        '>>>"abcd"[2:] \n What will be the output of the following Python statement?',
    'answers': [
      {'answerText': 'a', 'SCORE': true},
      {'answerText': 'ab', 'SCORE': false},
      {'answerText': 'cd', 'SCORE': false},
      {'answerText': 'dc', 'SCORE': false},
    ],
  },
  {
    'question':
        '>>>"a"+"bc" What will be the output of the following Python statement?',
    'answers': [
      {'answerText': 'a', 'SCORE': true},
      {'answerText': 'bc', 'SCORE': false},
      {'answerText': 'bca', 'SCORE': false},
      {'answerText': 'abc', 'SCORE': false},
    ],
  },
  {
    'question': 'What arithmetic operators cannot be used with strings?',
    'answers': [
      {'answerText': '+', 'SCORE': false},
      {'answerText': '*', 'SCORE': false},
      {'answerText': '-', 'SCORE': true},
      {'answerText': 'All of above!', 'SCORE': false},
    ],
  },
  {
    'question':
        ' Given a string example=”hello” what is the output of example.count(‘l’)?',
    'answers': [
      {'answerText': '2', 'SCORE': true},
      {'answerText': '1', 'SCORE': false},
      {'answerText': 'None', 'SCORE': false},
      {'answerText': '0', 'SCORE': false},
    ],
  },
  {
    'question':
        'To concatenate two strings to a third what statements are applicable?',
    'answers': [
      {'answerText': 's3 = s1 . s2', 'SCORE': false},
      {'answerText': 's3 = s1.add(s2)', 'SCORE': false},
      {'answerText': 's3 = s1.__add__(s2)', 'SCORE': true},
      {'answerText': 's3 = s1 * s2', 'SCORE': false},
    ],
  },
  {
    'question': ' Say s=”hello” what will be the return value of type(s)?',
    'answers': [
      {'answerText': 'int', 'SCORE': false},
      {'answerText': 'bool', 'SCORE': false},
      {'answerText': 'str', 'SCORE': true},
      {'answerText': 'String', 'SCORE': false},
    ],
  },
  {
    'question': 'To return the length of string s what command do we execute?',
    'answers': [
      {'answerText': 's.__len__()', 'SCORE': true},
      {'answerText': 'len(s)', 'SCORE': false},
      {'answerText': 'size(s)', 'SCORE': false},
      {'answerText': 's.size()', 'SCORE': false},
    ],
  },
  {
    'question': 'What function do you use to read a string?',
    'answers': [
      {'answerText': 'input(“Enter a string”)', 'SCORE': true},
      {'answerText': 'eval(input(“Enter a string”))', 'SCORE': false},
      {'answerText': 'enter(“Enter a string”)', 'SCORE': false},
      {'answerText': 'eval(enter(“Enter a string”))', 'SCORE': false},
    ],
  },
  {
    'question': 'Which of the following commands will create a list?',
    'answers': [
      {'answerText': 'list1 = list()', 'SCORE': false},
      {'answerText': 'list1 = [ ]', 'SCORE': false},
      {'answerText': 'list1 = list([1, 2, 3])', 'SCORE': false},
      {'answerText': 'All of the Above!', 'SCORE': true},
    ],
  },
  {
    'question':
        'Suppose listExample is [‘h’,’e’,’l’,’l’,’o’], what is len(listExample)?',
    'answers': [
      {'answerText': '5', 'SCORE': true},
      {'answerText': '4', 'SCORE': false},
      {'answerText': 'None', 'SCORE': false},
      {'answerText': 'Error', 'SCORE': false},
    ],
  },
  {
    'question': ' Suppose list1 is [3, 5, 25, 1, 3], what is min(list1)?',
    'answers': [
      {'answerText': '3', 'SCORE': false},
      {'answerText': '5', 'SCORE': false},
      {'answerText': '25', 'SCORE': false},
      {'answerText': '1', 'SCORE': true},
    ],
  },
  {
    'question': ' To shuffle the list(say list1) what function do we use?',
    'answers': [
      {'answerText': 'list1.shuffle()', 'SCORE': true},
      {'answerText': 'shuffle(list1)', 'SCORE': false},
      {'answerText': 'random.shuffle(list1)', 'SCORE': false},
      {'answerText': 'random.shuffleList(list1)', 'SCORE': false},
    ],
  },
  {
    'question': 'Which of the following is a Python tuple?',
    'answers': [
      {'answerText': '[1, 2, 3]', 'SCORE': false},
      {'answerText': '(1, 2, 3)', 'SCORE': true},
      {'answerText': ' {1, 2, 3}', 'SCORE': false},
      {'answerText': '{ }', 'SCORE': false},
    ],
  },
  {
    'question':
        'Suppose t = (1, 2, 4, 3), which of the following is incorrect?',
    'answers': [
      {'answerText': 'print(t[3])', 'SCORE': false},
      {'answerText': 't[3] = 45', 'SCORE': true},
      {'answerText': 'print(max(t))', 'SCORE': false},
      {'answerText': 'print(len(t))', 'SCORE': false},
    ],
  },
  {
    'question': '>>>t=(1,2,4,3) \n>>>t[1:3] \nOutput?',
    'answers': [
      {'answerText': '(1, 2)', 'SCORE': false},
      {'answerText': '(1, 2, 4)', 'SCORE': false},
      {'answerText': '(2, 4)', 'SCORE': true},
      {'answerText': '(2, 4, 3)', 'SCORE': false},
    ],
  },
  {
    'question':
        '>>>t1 = (1, 2, 4, 3) \n>>>t2 = (1, 2, 3, 4) \n>>>t1 \n\Output? < t2',
    'answers': [
      {'answerText': 'True', 'SCORE': false},
      {'answerText': 'False', 'SCORE': true},
      {'answerText': 'Error', 'SCORE': false},
      {'answerText': 'None', 'SCORE': false},
    ],
  },
  {
    'question': 'What is the data type of (1)?',
    'answers': [
      {'answerText': 'Tuple', 'SCORE': false},
      {'answerText': 'Integer', 'SCORE': true},
      {'answerText': 'List', 'SCORE': false},
      {'answerText': 'Both tuple and integer', 'SCORE': false},
    ],
  },
  {
    'question': 'What type of data is: a=[(1,1),(2,4),(3,9)]?',
    'answers': [
      {'answerText': 'Array of tuples', 'SCORE': false},
      {'answerText': 'List of tuples', 'SCORE': true},
      {'answerText': 'Tuples of lists', 'SCORE': false},
      {'answerText': ' Invalid type', 'SCORE': false},
    ],
  },
];
