import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:remar_flutter_app/global.dart';

bool isMonthValid = false;

class QuestionAnswer4Page extends StatefulWidget {

  const QuestionAnswer4Page({
    Key? key,
  }) : super(key: key);


  @override
  _QuestionAnswerPage4State createState() => _QuestionAnswerPage4State();
}

class _QuestionAnswerPage4State extends State<QuestionAnswer4Page> {
  String selectedArea = '';
  List<String> answers = [];
  String questionText = '';

  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  void loadQuestions() async {
    enableForwardNavigation = false;
    // Load the JSON data from the file
    String jsonString = await DefaultAssetBundle.of(context)
        .loadString('assets/raw_eng/questions2Modified.json');

    // Parse the JSON string into a list of objects
    List<dynamic> jsonData = jsonDecode(jsonString);

    // Extract data from the first question (question number 9)
    Map<String, dynamic> firstQuestionData = jsonData[3];


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
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.8,
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.15,
              child: Text(questionText,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.4,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.6,
              child: Scrollbar(
                controller: _controller,
                child: ListView.separated(
                  controller: _controller,
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
          month = answer;
          validateMonth(month);
          if(isMonthValid == true) {
            enableForwardNavigation = true;
          }

          Container(
            color: isSelected && isMonthValid ? Colors.green: null,
            padding: const EdgeInsets.all(1.0),
            margin: const EdgeInsets.symmetric(vertical: 1.0),
            child: Text(
              answer,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          );

        });

      },

      child: Container(
          color: isSelected && isMonthValid ? Colors.green : null,
        padding: const EdgeInsets.all(1.0),
        margin: const EdgeInsets.symmetric(vertical: 1.0),
        child: Text(
          answer,
          style: TextStyle(
            color: isSelected && !isMonthValid ? Colors.black : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

void validateMonth(String month) {
  var currentDate = DateTime.now();
  var currentMonth = currentDate.month;
  var currentYear = currentDate.year;
  var selectedMonth =0;

  switch (month) {
    case "January" : (selectedMonth=1);
    case "February" : (selectedMonth=2);
    case "March" : (selectedMonth=3);
    case "April" : (selectedMonth=4);
    case "May" : (selectedMonth=5);
    case "June" : (selectedMonth=6);
    case "July" : (selectedMonth=7);
    case "August" : (selectedMonth=8);
    case "September" : (selectedMonth=9);
    case "October" : (selectedMonth=10);
    case "November" : (selectedMonth=11);
    case "December" : (selectedMonth=12);
  }



  if(selectedMonth > currentMonth  && year == currentYear.toString()) {
    isMonthValid = false;
  }
  else {
    isMonthValid = true;
  }

}

