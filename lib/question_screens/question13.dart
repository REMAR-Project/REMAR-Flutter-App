import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:remar_flutter_app/global.dart';


class QuestionAnswer13Page extends StatefulWidget {


  const QuestionAnswer13Page({
    super.key,
});

  @override
  _QuestionAnswerPage13State createState() => _QuestionAnswerPage13State();
  }


class _QuestionAnswerPage13State extends State<QuestionAnswer13Page> {
  String selectedAnswer = '';
  String selectedArea = '';
  List<String> answers = [];
  List<String> areas = [];
  String questionText = '';
  String extraDetailText = '';
  bool isExpanded = false;
  bool displayAnswers = false; // Flag to control displaying answers

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

    if(backwardsNavigation) {

      setState(() {
        selectedAnswer =protectedAreaResponse;
      });
    }

    if(protectedAreaResponse=="Yes") {
      displayAnswers = true;
    }



    // Load the JSON data from the file
    String jsonString = await DefaultAssetBundle.of(context)
        .loadString('assets/raw_eng/questions2Modified.json');
    // Parse the JSON string into a list of objects
    List<dynamic> jsonData = jsonDecode(jsonString);
    // Extract data from the first question (question number 9)
    Map<String, dynamic> firstQuestionData = jsonData[12];
    // Set question text and answers list
    setState(() {

      questionText = firstQuestionData['question'];
      extraDetailText = firstQuestionData['extraDetailText'];

      Map<String, dynamic> answerMap = firstQuestionData['answers'];
      List<dynamic> stateList = answerMap[state];


      // Cast answers to List<String>
      answers = stateList.map((answer) => answer.toString()).toList();
      areas = stateList.map((area) => area.toString()).toList();


    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text(
            questionText,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              buildCheckbox("Yes", selectedAnswer == "Yes"),
              const SizedBox(width: 10.0),
              buildCheckbox("No", selectedAnswer == "No"),
              const SizedBox(width: 10.0),
              buildCheckbox("I don't know", selectedAnswer == "I don't know"),
            ],
          ),
          const SizedBox(height: 20.0),
          Text(
            extraDetailText,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
          if (displayAnswers)
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.6,
              child: Scrollbar(
                child: ListView.separated(
                  itemCount: answers.length,
                  itemBuilder: (BuildContext context, int index) {
                    return buildAnswerButton(answers[index]);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider();
                  },
                ),
              ),
            ),
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = true;
                selectedArea = answers as String;
                protectedArea = answers as String;
                enableForwardNavigation = true;
                backwardsNavigation = false;
              });
            },
            child: Container(

            ),
          ),
        ],
      ),
    );
  }

  Widget buildCheckbox(String title, bool selected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAnswer = title;
          // Update the flag based on the selected answer
          displayAnswers = selectedAnswer == "Yes";
          protectedAreaResponse = title;
          enableForwardNavigation = true;
        });
      },
      child: Row(
        children: [
          Container(
            width: 24.0,
            height: 24.0,
            margin: const EdgeInsets.only(right: 8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: selected ? Colors.green : Colors.transparent,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAnswerButton(String answer) {
    bool isSelected = answer == selectedArea;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedArea = answer;
          protectedArea = selectedArea;

        });
      },
      child: Container(
        color: isSelected
        ? (isSelected  ? Colors.green : null)
        : (backwardsNavigation ? (answer == protectedArea ? Colors.green : null) : null),

        padding: const EdgeInsets.all(12.0),
        margin: const EdgeInsets.symmetric(vertical: 8.0),
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
