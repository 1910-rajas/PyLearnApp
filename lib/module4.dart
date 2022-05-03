import 'package:flutter/material.dart';
import 'answers.dart';

class Mod4Page extends StatefulWidget {
  @override
  _HomeQuizState createState() => _HomeQuizState();
}

class _HomeQuizState extends State<Mod4Page> {
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
          'Module 4 Quiz',
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
                constraints: BoxConstraints.tightForFinite(
                  width: double.infinity,
                ),
                width: double.infinity,
                height: 250,
                margin: EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
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
    'question': 'Which of the following statements create a dictionary?',
    'answers': [
      {'answerText': 'd = {}', 'SCORE': false},
      {'answerText': 'd = {“john”:40, “peter”:45}', 'SCORE': false},
      {'answerText': 'd = {40:”john”, 45:”peter”}', 'SCORE': false},
      {'answerText': 'All of the mentioned', 'SCORE': true},
    ],
  },
  {
    'question': 'd = {"john":40, "peter":45} \nOutput?',
    'answers': [
      {'answerText': '“john”, 40, 45, and “peter”', 'SCORE': false},
      {'answerText': '“john” and “peter”', 'SCORE': true},
      {'answerText': '40 and 45', 'SCORE': false},
      {'answerText': 'd = (40:”john”, 45:”peter”)', 'SCORE': false},
    ],
  },
  {
    'question':
        'd1 = {"john":40, "peter":45}\n d2 = {"john":466, "peter":45}\n d1 > d2 \nOutput?',
    'answers': [
      {'answerText': 'True', 'SCORE': false},
      {'answerText': 'False', 'SCORE': false},
      {'answerText': 'Error', 'SCORE': true},
      {'answerText': 'None', 'SCORE': false},
    ],
  },
  {
    'question': 'Which of these about a dictionary is false?',
    'answers': [
      {
        'answerText': 'The values of a dictionary can be accessed using keys',
        'SCORE': false
      },
      {
        'answerText': 'The keys of a dictionary can be accessed using values',
        'SCORE': true
      },
      {'answerText': 'Dictionaries aren’t ordered', 'SCORE': false},
      {'answerText': 'Dictionaries are mutable', 'SCORE': false},
    ],
  },
  {
    'question': 'Which of the following isn’t true about dictionary keys?',
    'answers': [
      {'answerText': 'More than one key isn’t allowed', 'SCORE': false},
      {'answerText': 'Keys must be immutable', 'SCORE': false},
      {'answerText': 'Keys must be integers', 'SCORE': true},
      {
        'answerText':
            'When duplicate keys encountered, the last assignment wins',
        'SCORE': false
      },
    ],
  },
  {
    'question': 'Which of the following is the use of function in python?',
    'answers': [
      {
        'answerText': 'Functions are reusable pieces of programs',
        'SCORE': true
      },
      {
        'answerText':
            'Functions don’t provide better modularity for your application',
        'SCORE': false
      },
      {
        'answerText': 'you can’t also create your own functions',
        'SCORE': false
      },
      {'answerText': 'All of the mentioned', 'SCORE': false},
    ],
  },
  {
    'question': ' Which keyword is used for function?',
    'answers': [
      {'answerText': 'Fun', 'SCORE': false},
      {'answerText': 'Define', 'SCORE': false},
      {'answerText': 'Def', 'SCORE': true},
      {'answerText': 'Function', 'SCORE': false},
    ],
  },
  {
    'question': 'Which are the advantages of functions in python?',
    'answers': [
      {'answerText': 'Reducing duplication of code', 'SCORE': false},
      {
        'answerText': 'Decomposing complex problems into simpler pieces',
        'SCORE': false
      },
      {'answerText': 'Improving clarity of the code', 'SCORE': false},
      {'answerText': 'All of the mentioned', 'SCORE': true},
    ],
  },
  {
    'question': 'What are the two main types of functions?',
    'answers': [
      {'answerText': 'Custom function', 'SCORE': true},
      {
        'answerText': 'Built-in function & User defined function',
        'SCORE': false
      },
      {'answerText': 'User function', 'SCORE': false},
      {'answerText': 'System function', 'SCORE': false},
    ],
  },
  {
    'question': 'Where is function defined?',
    'answers': [
      {'answerText': 'Module', 'SCORE': false},
      {'answerText': 'Class', 'SCORE': false},
      {'answerText': 'Another Function', 'SCORE': false},
      {'answerText': 'All of the above', 'SCORE': true},
    ],
  },
  {
    'question': 'What is called when a function is defined inside a class?',
    'answers': [
      {'answerText': 'Module', 'SCORE': false},
      {'answerText': 'Class', 'SCORE': false},
      {'answerText': 'Another function', 'SCORE': false},
      {'answerText': 'Method', 'SCORE': true},
    ],
  },
  {
    'question': ' Which of the following refers to mathematical function?',
    'answers': [
      {'answerText': 'sqrt', 'SCORE': true},
      {'answerText': 'rhombus', 'SCORE': false},
      {'answerText': 'add', 'SCORE': false},
      {'answerText': 'rec', 'SCORE': false},
    ],
  },
  {
    'question':
        'Python supports the creation of anonymous functions at runtime, using a construct called _____?',
    'answers': [
      {'answerText': 'lambda', 'SCORE': true},
      {'answerText': 'pi', 'SCORE': false},
      {'answerText': 'anonymous', 'SCORE': false},
      {'answerText': 'None of above', 'SCORE': false},
    ],
  },
  {
    'question': 'Does Lambda contains return statements?',
    'answers': [
      {'answerText': 'True', 'SCORE': false},
      {'answerText': 'false', 'SCORE': true},
      // {'answerText': '', 'SCORE': false},
      // {'answerText': '', 'SCORE': false},
    ],
  },
  {
    'question': 'What is a variable defined outside a function referred to as?',
    'answers': [
      {'answerText': 'A static variable', 'SCORE': false},
      {'answerText': 'A global variable', 'SCORE': true},
      {'answerText': 'A local variable', 'SCORE': false},
      {'answerText': 'An automatic variable', 'SCORE': false},
    ],
  },
  {
    'question': 'What is a variable defined inside a function referred to as?',
    'answers': [
      {'answerText': 'A global variable', 'SCORE': false},
      {'answerText': 'A volatile variable', 'SCORE': false},
      {'answerText': 'A local variable', 'SCORE': true},
      {'answerText': 'An automatic variable', 'SCORE': false},
    ],
  },
  {
    'question':
        ' If a function doesn’t have a return statement, which of the following does the function return?',
    'answers': [
      {'answerText': 'int', 'SCORE': false},
      {'answerText': 'null', 'SCORE': false},
      {'answerText': 'None', 'SCORE': true},
      {
        'answerText': 'An exception is thrown without return statement',
        'SCORE': false
      },
    ],
  },
  {
    'question':
        'How many keyword arguments can be passed to a function in a single function call?',
    'answers': [
      {'answerText': 'Zero', 'SCORE': false},
      {'answerText': 'One', 'SCORE': false},
      {'answerText': 'Zero or More', 'SCORE': true},
      {'answerText': 'One or More', 'SCORE': false},
    ],
  },
];
