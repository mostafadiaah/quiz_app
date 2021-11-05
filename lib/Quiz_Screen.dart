import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz_app/Win_Screen.dart';

import 'Lose_Screen.dart';

class QuizScreen extends StatefulWidget {
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int yesCounter = 0;
  int noCounter = 0;
  int counter = 0;
  int question = Random().nextInt(7);

  Random random = Random();

  List<String> questions = [
    'Have you ever wrote a letter?',
    'Have you ever smoked a cigarette?',
    'Have you ever had a fight with someone who was too old?',
    'Have you ever been on the radio or on television?',
    'Have you ever stayed awake for an entire night?',
    'Have you ever broken something, like a window, and ran away?',
    'Have you ever won a contest and received a prize?',
    'Have you ever met a famous person or a celebrity?',
  ];
  Set num = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Have You Ever'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 15),
              child: Text(
                '${questions[question]}',
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * .3,
              child: ElevatedButton(
                onPressed: () {
                  num.add(question);
                  int y = random.nextInt(7);
                  while (num.contains(y)) {
                    y = random.nextInt(7);
                  }

                  question = y;
                  num.add(y);
                  questions[y];
                  print(num);

                  yesCounter++;
                  counter++;
                  result();
                  setState(() {});
                },
                child: Text(
                  'Yes',
                  style: TextStyle(fontSize: 22),
                ),
                style: ElevatedButton.styleFrom(primary: Colors.green),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * .3,
              child: ElevatedButton(
                onPressed: () {
                  num.add(question);
                  int x = random.nextInt(7);
                  while (num.contains(x)) {
                    x = random.nextInt(7);
                  }

                  question = x;
                  num.add(x);
                  questions[question];
                  print(num);

                  noCounter++;
                  counter++;
                  result();
                  setState(() {});
                },
                child: Text(
                  'No',
                  style: TextStyle(fontSize: 22),
                ),
                style: ElevatedButton.styleFrom(primary: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }

  result() {
    if (noCounter > 2 && counter >= 5) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoseScreen()));
      setState(() {});
    } else if (yesCounter > 2 && counter >= 5) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => WinScreen()));
      setState(() {});
    }
  }
}
