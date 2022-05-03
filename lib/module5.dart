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
          'Module 5 Quiz',
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
    'question': 'Which of these definitions correctly describes a module?',
    'answers': [
      {
        'answerText':
            'Denoted by triple quotes for providing the specification of certain program elements',
        'SCORE': false
      },
      {
        'answerText':
            'Design and implementation of specific functionality to be incorporated into a program',
        'SCORE': true
      },
      {
        'answerText': 'Defines the specification of how it is to be used',
        'SCORE': false
      },
      {'answerText': 'Any program that reuses code', 'SCORE': false},
    ],
  },
  {
    'question': 'Which of the following is not an advantage of using modules?',
    'answers': [
      {
        'answerText': 'Provides a means of reuse of program code',
        'SCORE': false
      },
      {'answerText': 'Provides a means of dividing up tasks', 'SCORE': false},
      {
        'answerText': 'Provides a means of reducing the size of the program',
        'SCORE': true
      },
      {
        'answerText':
            'Provides a means of testing individual parts of the program',
        'SCORE': false
      },
    ],
  },
  {
    'question':
        ' Program code making use of a given module is called a ______ of the module.',
    'answers': [
      {'answerText': 'Client', 'SCORE': true},
      {'answerText': 'Docstring', 'SCORE': false},
      {'answerText': 'Interface', 'SCORE': false},
      {'answerText': 'Modularity', 'SCORE': false},
    ],
  },
  {
    'question':
        ' In top-down design every module is broken into same number of submodules.',
    'answers': [
      {'answerText': 'True', 'SCORE': false},
      {'answerText': 'False', 'SCORE': true},
      // {'answerText': '', 'SCORE': false},
      // {'answerText': '', 'SCORE': false},
    ],
  },
  {
    'question': 'All modular designs are because of a top-down design process.',
    'answers': [
      {'answerText': 'False', 'SCORE': true},
      {'answerText': 'True', 'SCORE': false},
      // {'answerText': '', 'SCORE': false},
      // {'answerText': '', 'SCORE': false},
    ],
  },
  {
    'question': ' Which of the following isn’t true about main modules?',
    'answers': [
      {
        'answerText':
            'When a python file is directly executed, it is considered main module of a program',
        'SCORE': false
      },
      {
        'answerText': 'Main modules may import any number of modules',
        'SCORE': false
      },
      {
        'answerText': 'Special name given to main modules is: __main__',
        'SCORE': false
      },
      {
        'answerText': 'Other main modules can import main modules',
        'SCORE': true
      },
    ],
  },
  {
    'question': 'To open a file c:\scores.txt for reading, we use ______?',
    'answers': [
      {'answerText': 'infile = open(“c:\scores.txt”, “r”)', 'SCORE': false},
      {'answerText': 'infile = open(“c:\\scores.txt”, “r”)', 'SCORE': true},
      {
        'answerText': 'infile = open(file = “c:\scores.txt”, “r”)',
        'SCORE': false
      },
      {
        'answerText': 'infile = open(file = “c:\\scores.txt”, “r”)',
        'SCORE': false
      },
    ],
  },
  {
    'question': 'To open a file c:\scores.txt for writing, we use _______?',
    'answers': [
      {'answerText': 'outfile = open(“c:\scores.txt”, “w”)', 'SCORE': false},
      {'answerText': 'outfile = open(“c:\\scores.txt”, “w”)', 'SCORE': true},
      {
        'answerText': 'outfile = open(file = “c:\scores.txt”, “w”)',
        'SCORE': false
      },
      {
        'answerText': 'outfile = open(file = “c:\\scores.txt”, “w”)',
        'SCORE': false
      },
    ],
  },
  {
    'question': 'Which of the following statements are true?',
    'answers': [
      {
        'answerText':
            'When you open a file for reading, if the file does not exist, an error occurs',
        'SCORE': false
      },
      {
        'answerText':
            'When you open a file for writing, if the file does not exist, a new file is created',
        'SCORE': false
      },
      {
        'answerText':
            'When you open a file for writing, if the file exists, the existing file is overwritten with the new file',
        'SCORE': false
      },
      {'answerText': 'All of the mentioned', 'SCORE': true},
    ],
  },
  {
    'question': 'Which one of the following is not attributes of file?',
    'answers': [
      {'answerText': 'closed', 'SCORE': false},
      {'answerText': 'softspace', 'SCORE': false},
      {'answerText': 'rename', 'SCORE': true},
      {'answerText': 'mode', 'SCORE': false},
    ],
  },
  {
    'question': 'What is the current syntax of remove() a file?',
    'answers': [
      {'answerText': 'remove(file_name)', 'SCORE': true},
      {
        'answerText': 'remove(new_file_name, current_file_name,)',
        'SCORE': false
      },
      {'answerText': 'remove(() , file_name))', 'SCORE': false},
      {'answerText': 'none of the mentioned', 'SCORE': false},
    ],
  },
  {
    'question': 'What is the use of seek() method in files?',
    'answers': [
      {
        'answerText': 'sets the file’s current position at the offset',
        'SCORE': true
      },
      {
        'answerText': 'sets the file’s previous position at the offset',
        'SCORE': false
      },
      {
        'answerText': 'sets the file’s current position within the file',
        'SCORE': false
      },
      {'answerText': 'none of the mentioned', 'SCORE': false},
    ],
  },
  {
    'question': ' Which is/are the basic I/O connections in file?',
    'answers': [
      {'answerText': 'Standard Input', 'SCORE': false},
      {'answerText': 'Standard Output', 'SCORE': false},
      {'answerText': 'Standard Errors', 'SCORE': false},
      {'answerText': 'All of the mentioned', 'SCORE': true},
    ],
  },
  {
    'question': 'What is the current syntax of rename() a file?',
    'answers': [
      {'answerText': 'rename(current_file_name, new_file_name)', 'SCORE': true},
      {
        'answerText': 'rename(new_file_name, current_file_name,)',
        'SCORE': false
      },
      {
        'answerText': 'rename(()(current_file_name, new_file_name))',
        'SCORE': false
      },
      {'answerText': 'none of the mentioned', 'SCORE': false},
    ],
  },
  {
    'question': 'An exception is _______?',
    'answers': [
      {'answerText': 'an object', 'SCORE': true},
      {'answerText': 'a special function', 'SCORE': false},
      {'answerText': 'a standard module', 'SCORE': false},
      {'answerText': 'a module', 'SCORE': false},
    ],
  },
  {
    'question': 'How many except statements can a try-except block have?',
    'answers': [
      {'answerText': 'zero', 'SCORE': false},
      {'answerText': 'one', 'SCORE': false},
      {'answerText': 'more than one', 'SCORE': false},
      {'answerText': 'more than zero', 'SCORE': true},
    ],
  },
  {
    'question': ' When will the else part of try-except-else be executed?',
    'answers': [
      {'answerText': 'always', 'SCORE': false},
      {'answerText': 'when an exception occurs', 'SCORE': false},
      {'answerText': 'when no exception occurs', 'SCORE': true},
      {
        'answerText': 'when an exception occurs in to except block',
        'SCORE': false
      },
    ],
  },
  {
    'question': 'When is the finally block executed?',
    'answers': [
      {'answerText': 'when there is no exception', 'SCORE': false},
      {'answerText': 'when there is an exception', 'SCORE': false},
      {
        'answerText':
            'only if some condition that has been specified is satisfied',
        'SCORE': false
      },
      {'answerText': 'always', 'SCORE': true},
    ],
  },
  {
    'question': 'What happens when ‘1’ == 1 is executed?',
    'answers': [
      {'answerText': 'we get a True', 'SCORE': true},
      {'answerText': 'we get a False', 'SCORE': false},
      {'answerText': 'an TypeError occurs', 'SCORE': false},
      {'answerText': 'a ValueError occurs', 'SCORE': false},
    ],
  },
  {
    'question':
        'Which of the following is not an exception handling keyword in Python?',
    'answers': [
      {'answerText': 'try', 'SCORE': false},
      {'answerText': 'except', 'SCORE': false},
      {'answerText': 'accept', 'SCORE': true},
      {'answerText': 'finally', 'SCORE': false},
    ],
  },
  {
    'question': 'Syntax errors are also known as parsing errors.',
    'answers': [
      {'answerText': 'True', 'SCORE': true},
      {'answerText': 'False', 'SCORE': false},
      // {'answerText': '', 'SCORE': false},
      // {'answerText': '', 'SCORE': false},
    ],
  },
];
