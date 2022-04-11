import 'dart:async';

import 'package:flutter/material.dart';
import 'package:true_or_false/main.dart';
import 'package:true_or_false/result_screen.dart';
import 'package:true_or_false/test_data.dart';
import 'package:true_or_false/constants.dart';

class QuestionScreen extends StatefulWidget {
  int level;

  QuestionScreen({required this.level});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  List<Widget> choices = [];

  TestData testData = TestData();

  late Timer timer;

  int countdown = 10;

  int correctAnswers = 0;
  int wrongAnswers = 0;

  handleQuestionAnswered(answer) {
    var isFinished = testData.isTestFinished;
    switch (answer) {
      case 'FALSE_ANSWERED':
        {
          setState(() {
            if (testData.getAnswer(widget.level) == false) {
              choices.add(trueIcon);
              correctAnswers = correctAnswers + 1;
            } else {
              choices.add(falseIcon);
              wrongAnswers = wrongAnswers + 1;
            }
            testData.nextQuestion(widget.level);
            countdown = 10;
          });
          if (isFinished) {
            timer.cancel();
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultScreen(
                          correctAnswers: correctAnswers,
                          wrongAnswers: wrongAnswers,
                          questionCount: correctAnswers + wrongAnswers,
                        )));
          }
        }

        break;

      case 'TRUE_ANSWERED':
        {
          setState(() {
            if (testData.getAnswer(widget.level) == true) {
              choices.add(trueIcon);
              correctAnswers = correctAnswers + 1;
            } else {
              choices.add(falseIcon);
              wrongAnswers = wrongAnswers + 1;
            }
            testData.nextQuestion(widget.level);
            countdown = 10;
          });
          if (isFinished) {
            timer.cancel();
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultScreen(
                          correctAnswers: correctAnswers,
                          wrongAnswers: wrongAnswers,
                          questionCount: correctAnswers + wrongAnswers,
                        )));
          }
        }

        break;
      default:
    }
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      var isFinished = testData.isTestFinished;
      setState(() {
        if (countdown == 0) {
          choices.add(falseIcon);
          wrongAnswers = wrongAnswers + 1;
          testData.nextQuestion(widget.level);
          countdown = 10;
        } else {
          countdown = countdown - 1;
        }
      });
      if (isFinished && countdown == 0) {
        timer.cancel();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ResultScreen(
                      correctAnswers: correctAnswers,
                      wrongAnswers: wrongAnswers,
                      questionCount: correctAnswers + wrongAnswers,
                    )));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[800],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(right: 10.0, left: 10.0, top: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(500),
                        color: Colors.deepPurple[800],
                        boxShadow: [
                          BoxShadow(color: Colors.white, spreadRadius: 3)
                        ]),
                    child: Center(
                      child: Text("$countdown",
                          style: TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      testData.getQuestionText(widget.level),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Wrap(
                spacing: 3,
                runSpacing: 3,
                children: choices,
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red[400],
                              textStyle: TextStyle(color: Colors.white),
                              padding: EdgeInsets.all(12),
                            ),
                            child: Icon(Icons.thumb_down, size: 30.0),
                            onPressed: () {
                              handleQuestionAnswered('FALSE_ANSWERED');
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green[400],
                              textStyle: TextStyle(color: Colors.white),
                              padding: EdgeInsets.all(12),
                            ),
                            child: Icon(Icons.thumb_up, size: 30.0),
                            onPressed: () {
                              handleQuestionAnswered('TRUE_ANSWERED');
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
