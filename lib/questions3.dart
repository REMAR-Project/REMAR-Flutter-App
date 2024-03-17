import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'app_bar.dart';

class QuestionAnswer3Page extends StatefulWidget {
  @override
  _QuestionAnswerPage3State createState() => _QuestionAnswerPage3State();
}

class _QuestionAnswerPage3State extends State<QuestionAnswer3Page> {
  String selectedArea = '';
  List<String> answers = [];
  String questionText = '';

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  void loadQuestions() async {
     // Load the JSON data from the file
      String jsonString = await DefaultAssetBundle.of(context)
          .loadString('assets/raw_eng/questions2Modified.json');

      // Parse the JSON string into a list of objects
      List<dynamic> jsonData = jsonDecode(jsonString);

      // Extract data from the first question (question number 9)
      Map<String, dynamic> firstQuestionData = jsonData[0];


      // Set question text and answers list
      setState(() {
        questionText = firstQuestionData['questionText'];

        // Extract answers from the answers map
        List<dynamic> answerList = firstQuestionData['answers'];

        // Cast answers to List<String>
        answers = answerList.map((answer) => answer.toString()).toList();
      });
    }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/raster_q0_0.png',
                  width: 100,
                  height: 125,
                ),
                const Text(
                  "Cardisoma_guanhumi",
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Text(questionText,
                  style: const TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height *0.55,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Scrollbar(
                child: ListView.separated(
                  itemCount: answers.length,
                  itemBuilder: (BuildContext context, int index) {
                    return buildAnswerButton(answers[index]);
                  }, separatorBuilder: (BuildContext context, int index) {
                    return const Divider();
                },
                ),
              ),
            ),
          ], // Column children
        ), // Column
      ), // Scaffold
    ); // MaterialApp
  }

  Widget buildAnswerButton(String answer) {
    bool isSelected = answer == selectedArea;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedArea = answer;
        });
      },
      child: Container(
        color: isSelected ? Colors.green : null,
        padding: const EdgeInsets.all(1.0),
        margin: const EdgeInsets.symmetric(vertical: 1.0),
        child: Text(
          answer,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}


