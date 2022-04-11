import 'package:flutter/material.dart';

class LevelToggleButton extends StatelessWidget {
  final String buttonText;
  LevelToggleButton({required this.buttonText});

  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    final double screenHeight = screenInfo.size.height;
    final double screenWidth = screenInfo.size.width;

    return SizedBox(
      height: screenHeight / 9,
      width: screenWidth / 1.3,
      child: Card(
        child: Center(
            child: Text(
          buttonText,
          style: TextStyle(
              fontSize: screenWidth / 15,
              color: Colors.deepPurple[700],
              fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
