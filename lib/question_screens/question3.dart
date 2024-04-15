import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'global.dart';

List<String> yearList = []; // Declaration of yearList


class QuestionAnswer3Page extends StatefulWidget {

  final String name;
  final String image;
  final String year;
  final Function(String) onYearSelected;


  const QuestionAnswer3Page({
    Key? key,
    required this.name,
    required this.image,
    required this.year, required this.onYearSelected,
  }) : super(key: key);


  @override
  _QuestionAnswerPage3State createState() => _QuestionAnswerPage3State();
}

class _QuestionAnswerPage3State extends State<QuestionAnswer3Page> {
  String selectedArea = '';
  String questionText = '';
  String year='';


  @override
  void initState() {
    super.initState();
    getYearList();
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
    Map<String, dynamic> firstQuestionData = jsonData[2];


    // Set question text and answers list
    setState(() {
      questionText = firstQuestionData['questionText'];

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
                  widget.image,
                  width: 100,
                  height: 125,
                ),
                Text(
                  widget.name,
                  style: const TextStyle(fontSize: 24),
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
              height: MediaQuery.of(context).size.height *0.4,
              width: MediaQuery.of(context).size.width * 0.6,
              child: Scrollbar(
                child: ListView.separated(
                  itemCount: yearList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return buildAnswerButton(yearList[index]);
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
          year = answer;
          widget.onYearSelected(year);
          enableForwardNavigation = true;
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

void getYearList() {

  var currentDate = DateTime.now();
  var currentYear = currentDate.year;
  var startYear = currentYear - 10;

  for (var yearCount = 0; yearCount < 10; yearCount++) {
    startYear = startYear + 1;
    String getYear = startYear.toString();
    yearList.add(getYear);
  }

}