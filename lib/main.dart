import 'package:flutter/material.dart';
import 'package:quizz/quiz.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Named Routes Demo',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const MyApp(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/quizz': (context) => const Quizz(),
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ButtonStyle answerBtnStyle = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
        primary: Colors.pink,
        fixedSize: const Size(200, 60),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quizz Challenge',
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.pink,
            title: const Text('Quizz Challenge'),
          ),
          body: Center(
            child: ElevatedButton(
              style: answerBtnStyle,
              onPressed: () {
                Navigator.pushNamed(context, '/quizz');
              },
              child: const Text("Start Quizz"),
            ),
          )),
    );
  }
}
