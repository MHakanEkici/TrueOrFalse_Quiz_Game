import 'dart:math';

import 'package:flutter/material.dart';
import 'package:true_or_false/main.dart';

class ResultScreen extends StatefulWidget {
  int wrongAnswers;
  int correctAnswers;
  int questionCount;

  ResultScreen(
      {required this.correctAnswers,
      required this.wrongAnswers,
      required this.questionCount});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    final double screenHeight = screenInfo.size.height;
    final double screenWidth = screenInfo.size.width;

    return Scaffold(
      backgroundColor: Colors.deepPurple[800],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              right: screenWidth / 28,
              left: screenWidth / 28,
              top: screenHeight / 14,
              bottom: screenHeight / 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "Test Bitti",
                    style: TextStyle(
                        color: Colors.white, fontSize: screenWidth / 8),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Text(
                          widget.questionCount.toString() +
                              "/" +
                              widget.correctAnswers.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white, fontSize: screenWidth / 11),
                        ),
                        Text(
                          " Soruya doğru cevap verdiniz",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white, fontSize: screenWidth / 14),
                        ),
                      ],
                    )),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: SizedBox(
                      height: screenHeight / 6,
                      width: screenWidth / 1.5,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.deepPurpleAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(screenWidth / 20))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        },
                        child: Text(
                          "Tekrar Oyna",
                          style: TextStyle(
                              color: Colors.white, fontSize: screenWidth / 14),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
