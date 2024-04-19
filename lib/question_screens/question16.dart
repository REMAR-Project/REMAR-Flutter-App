import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:remar_flutter_app/question_screens/global.dart';
import 'package:url_launcher/url_launcher.dart';

class QuestionAnswer16Page extends StatefulWidget {


  const QuestionAnswer16Page({
    Key? key
  }) : super(key: key);

  @override
  _QuestionAnswer16Page createState() => _QuestionAnswer16Page();
}

class _QuestionAnswer16Page extends State<QuestionAnswer16Page> {
  late String description = '';
  String selectedAnswer = '';
  late String choiceOneText = '';
  late String choiceTwoText = '';
  late String choiceThreeText = '';

  @override
  void initState() {
    super.initState();
    loadQuestionData();
  }

  void loadQuestionData() async {

    enableForwardNavigation = false;

    // Load JSON data from asset file
    String jsonString = await DefaultAssetBundle.of(context)
        .loadString('assets/raw_eng/questions2Modified.json');

    // Parse JSON data
    List<dynamic> jsonData = jsonDecode(jsonString);

    // Extract question data for Question16
    Map<String, dynamic> questionData = jsonData[15];


    // Assign values to variables
    setState(() {
      description = questionData['description'];
      choiceOneText = questionData['choiceOneText'];
      choiceTwoText = questionData['choiceTwoText'];
      choiceThreeText = questionData['choiceThreeText'];
     // enableForwardNavigation = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            buildButton(choiceOneText, selectedAnswer == choiceOneText),
            const SizedBox(height: 10),
            buildButton(choiceTwoText, selectedAnswer == choiceTwoText),
            const SizedBox(height: 10),
            buildButton(choiceThreeText, selectedAnswer == choiceThreeText),
            const SizedBox(height: 30),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text:
                'If you want to contact REMAR, find out about ways to engage more with this research, ask or suggest something, please send a message to ',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: 'remar.quest@gmail.com',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 14, 172, 51),
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        launch(
                            'mailto:remar.quest@gmail.com?subject=Question for REMAR');
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton(String title, bool selected) {
    return SizedBox(
      width: double.infinity,
      height: 48.0,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedAnswer = title;
          });
        },
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          backgroundColor: Colors.green, // Button color remains green
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black, // Text color remains black
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

