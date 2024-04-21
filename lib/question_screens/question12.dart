import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:remar_flutter_app/global.dart';
import 'package:remar_flutter_app/question_screens/questions_utils.dart';

class QuestionAnswer12Page extends StatefulWidget {


  const QuestionAnswer12Page({
    Key? key,
  }) : super(key: key);

  @override
  _QuestionAnswerPage12State createState() => _QuestionAnswerPage12State();
}

class _QuestionAnswerPage12State extends State<QuestionAnswer12Page> {
  String selectedArea = '';
  List<String> answers = [];
  String descriptionText = '';


  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  void loadQuestions() async {


   enableForwardNavigation = false;

   if(backwardsNavigation==true) {
     enableForwardNavigation =true;
   }


    // Load the JSON data from the file
    String jsonString = await DefaultAssetBundle.of(context)
        .loadString('assets/raw_eng/questions2Modified.json');

    // Parse the JSON string into a list of objects
    List<dynamic> jsonData = jsonDecode(jsonString);

    // Extract data from the first question (question number 9)
    Map<String, dynamic> firstQuestionData = jsonData[11];

    // Set question text and answers list
    setState(() {
      descriptionText = firstQuestionData['description'];

      // Extract answers from the answers map based on the selected state
      Map<String, dynamic> answerMap = firstQuestionData['answers'];
      List<dynamic> stateList = answerMap[state];


      // Cast answers to List<String>
      answers = stateList.map((answer) => answer.toString()).toList();
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
                  selectedCrabSpeciesImage,
                  width: 100,
                  height: 125,
                ),
                Text(
                  selectedCrabSpecies,
                  style: const TextStyle(fontSize: 24),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.15,
              child: Text(descriptionText,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height *0.4,
              width: MediaQuery.of(context).size.width * 0.6,
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
          county= answer;

          enableForwardNavigation = true;

        });
      },
      child: Container(
        color: isSelected
            ? (isSelected ? Colors.green : null)
            : (backwardsNavigation ? (answer == county ? Colors.green : null) : null),
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