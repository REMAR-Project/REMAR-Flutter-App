import 'dart:convert';

import 'package:flutter/material.dart';

class QuestionAnswer15Page extends StatefulWidget {
  final String name;
  final String image;
  final String additionalInfo;
  final Function(String) onAdditionalInfoSelected;

  const QuestionAnswer15Page({
   Key? key,
    required this.name,
    required this.image,
    required this.additionalInfo,
    required this.onAdditionalInfoSelected,

}) : super(key: key);

  @override
  _QuestionAnswerPage15State createState() => _QuestionAnswerPage15State();
}

class _QuestionAnswerPage15State extends State<QuestionAnswer15Page> {
  String selectedArea = '';
  String questionText = '';
  String selectedAnswer = '';
  List<String> answers = [];
  String otherText = '';
  int otherPosition = 0;
  String additionalInfo='';

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
    Map<String, dynamic> firstQuestionData = jsonData[14];

    // Set question text and answers list
    setState(() {
      questionText = firstQuestionData['description'];
      otherText = firstQuestionData['otherText'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            height: MediaQuery.of(context).size.height * 0.15,
            child: selectedAnswer == 'Yes' ? Text(
              otherText,
              style: const TextStyle(fontSize: 16),
            ) : Text(
              questionText,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          if (selectedAnswer != 'Yes')
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                children: answers.map((answer) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 7.0), // Add vertical padding
                    child: buildAnswerButton(answer, selectedAnswer == answer),
                  );
                }).toList(),
              ),
            ),
          const SizedBox(height: 20),
          if (selectedAnswer == 'Yes')
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Type your observation',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  // Handle text field changes
                },
              ),
            ),
        ], // Column children
      ), // Column
    );
  }

  Widget buildAnswerButton(String answer, bool selected) {
    bool isSelected = answer == selectedArea;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAnswer = answer;
          additionalInfo = answer;
          widget.onAdditionalInfoSelected(additionalInfo);
        });
      },
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(1.0),
        margin: const EdgeInsets.symmetric(vertical: 1.0),
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: isSelected ? Colors.green : null,
            border: const Border(bottom: BorderSide(color: Colors.black))),
        height: 30,
        child: Text(
          answer,
          textAlign: TextAlign.start,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}