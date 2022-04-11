import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {

  final VoidCallback onPress;
  final String buttonText;
  RoundButton({required this.onPress, required this.buttonText});


  @override
  Widget build(BuildContext context) {

    var screenInfo = MediaQuery.of(context);
    final double screenHeight = screenInfo.size.height;
    final double screenWidth = screenInfo.size.width;

    return SizedBox(
                height: screenWidth / 2,
                width: screenWidth / 2,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurpleAccent,
                      side: const BorderSide(width: 3.0, color: Colors.white),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(500.0))),
                  onPressed: onPress,
                  child: Text(
                    buttonText,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth / 11,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              );
  }
}