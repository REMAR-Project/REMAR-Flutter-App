import 'dart:convert';
import 'package:flutter/material.dart';

class QuestionAnswer13Page extends StatefulWidget {
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
    Map<String, dynamic> firstQuestionData = jsonData[12];
    // Set question text and answers list
    setState(() {
      questionText = firstQuestionData['question'];
      extraDetailText = firstQuestionData['extraDetailText'];
      // Extract areas from the answers map
      List<dynamic> areasList = firstQuestionData['answers']
          .values
          .expand((areaList) => areaList as List<dynamic>)
          .toList();
      // Cast areas to List<String>
      areas = areasList.map((area) => area.toString()).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> displayedAreas = isExpanded ? areas : areas.take(4).toList();

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text(
            questionText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          SizedBox(height: 10.0),
          Row(
            children: [
              buildCheckbox("Yes", selectedAnswer == "Yes"),
              SizedBox(width: 10.0),
              buildCheckbox("No", selectedAnswer == "No"),
              SizedBox(width: 10.0),
              buildCheckbox("I don't know", selectedAnswer == "I don't know"),
            ],
          ),
          SizedBox(height: 20.0),
          Text(
            extraDetailText,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 20.0),
          for (var area in displayedAreas) buildAnswerButton(area),
          if (!isExpanded)
            GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = true;
                });
              },
              child: Container(
                color: Colors.green,
                padding: EdgeInsets.all(12.0),
                margin: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Name not in list",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
        });
      },
      child: Row(
        children: [
          Container(
            width: 24.0,
            height: 24.0,
            margin: EdgeInsets.only(right: 8.0),
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
        });
      },
      child: Container(
        color: isSelected ? Colors.green : null,
        padding: EdgeInsets.all(12.0),
        margin: EdgeInsets.symmetric(vertical: 8.0),
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
