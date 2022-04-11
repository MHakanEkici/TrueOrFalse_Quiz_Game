import 'package:flutter/material.dart';
import 'package:true_or_false/question_screen.dart';
import 'package:true_or_false/widgets/RoundButton.dart';
import 'package:true_or_false/widgets/LevelToggleButton.dart';

void main() => runApp(TrueOrFalse());

class TrueOrFalse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<bool> toggleButtonsStatus = [false, true, false];

  int? selectedLevel = 1;

  handleChangeLevel(index) {
    setState(() {
      selectedLevel = index;
      for (int buttonIndex = 0;
          buttonIndex < toggleButtonsStatus.length;
          buttonIndex++) {
        toggleButtonsStatus[buttonIndex] = buttonIndex == index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    final double screenHeight = screenInfo.size.height;
    final double screenWidth = screenInfo.size.width;

    return Scaffold(
      backgroundColor: Colors.deepPurple[700],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Text(
                  "Doğru mu? Yanlış mı?",
                  style: TextStyle(
                      fontSize: screenWidth / 12, color: Colors.white),
                ),
              ),
              ToggleButtons(
                  direction: Axis.vertical,
                  fillColor: Colors.amber,
                  onPressed: (index) {
                    handleChangeLevel(index);
                  },
                  isSelected: toggleButtonsStatus,
                  children: [
                    LevelToggleButton(buttonText: "Kolay"),
                    LevelToggleButton(buttonText: "Orta"),
                    LevelToggleButton(buttonText: "Zor"),
                  ]),
              RoundButton(
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                QuestionScreen(level: selectedLevel!)));
                  },
                  buttonText: "Başla")
            ],
          ),
        ),
      ),
    );
  }
}
