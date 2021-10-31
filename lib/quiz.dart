import 'package:flutter/material.dart';

class Quizz extends StatefulWidget {
  const Quizz({Key? key}) : super(key: key);

  @override
  _QuizzState createState() => _QuizzState();
}

class _QuizzState extends State<Quizz> {
  int _questionIndex = 0;
  int _finalScore = 0;
  int _wrongScore = 0;
  int _questionNumber = 1;

  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'ans': true},
        {'text': 'Red', 'ans': false},
        {'text': 'Green', 'ans': false},
        {'text': 'White', 'ans': false},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'ans': false},
        {'text': 'Snake', 'ans': true},
        {'text': 'Elephant', 'ans': false},
        {'text': 'Lion', 'ans': false},
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Max', 'ans': false},
        {'text': 'Max', 'ans': false},
        {'text': 'Max', 'ans': true},
        {'text': 'Max', 'ans': false},
      ],
    },
  ];

  void changeQuestion(bool score) {
    setState(() {
      _questionIndex = _questionIndex + 1;
      _questionNumber = _questionNumber + 1;
      if (score) {
        _finalScore = _finalScore + 1;
      } else {
        _wrongScore = _wrongScore + 1;
      }
    });
    print("final score: $_finalScore");
  }

  void resetQuizz() {
    setState(() {
      _questionIndex = 0;
      _finalScore = 0;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle answerBtnStyle = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
        primary: Colors.pink,
        fixedSize: const Size(300, 60),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quizz Challange',
      home: Scaffold(
          appBar: _questionIndex < _questions.length
              ? AppBar(
                  backgroundColor: Colors.pink,
                  title: Text(
                    'Question: $_questionNumber of ${_questions.length}',
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  actions: [
                    Center(
                        child: Container(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Text(
                              'Score: $_finalScore',
                              style: const TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ))),
                  ],
                )
              : AppBar(
                  backgroundColor: Colors.pink,
                  title: const Text(
                    'Completed',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  actions: [
                    Center(
                        child: Container(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Text(
                              'Final Score: $_finalScore',
                              style: const TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ))),
                  ],
                ),
          body: _questionIndex < _questions.length
              ? Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(20.0),
                        child: Text(
                          _questions[_questionIndex]['questionText'] as String,
                          style: const TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ...(_questions[_questionIndex]['answers']
                              as List<Map<String, Object>>)
                          .map((answer) {
                        return Container(
                          margin: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                            style: answerBtnStyle,
                            onPressed: () =>
                                changeQuestion(answer['ans'] as bool),
                            child: Text(answer['text'] as String),
                          ),
                        );
                      }).toList()
                    ],
                  ),
                )
              : Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 100.0,
                      ),
                      Text(
                        "Total Questions: ${_questions.length}",
                        style: const TextStyle(
                            color: Colors.pink,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Correct Answers: $_finalScore",
                        style: const TextStyle(
                            color: Colors.green,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Incorrect Answers: $_wrongScore",
                        style: const TextStyle(
                            color: Colors.red,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      ElevatedButton(
                        style: answerBtnStyle,
                        onPressed: () {
                          Navigator.pushNamed(context, '/');
                        },
                        child: const Text("Restart Again"),
                      ),
                    ],
                  ),
                )),
    );
  }
}
