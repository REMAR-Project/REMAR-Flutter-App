import 'dart:convert';
import 'package:flutter/material.dart';

class QuestionAnswer12Page extends StatefulWidget {
  final String state;
  final String name;
  final String image;

  const QuestionAnswer12Page({
    Key? key,
    required this.state,
    required this.name,
    required this.image,
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
      List<dynamic> stateList = answerMap[widget.state];


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
                  widget.image, // Use the provided image
                  width: 100,
                  height: 125,
                ),
                Text(
                  widget.name,
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Text(
                descriptionText,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.55,
              width: MediaQuery.of(context).size.width * 0.8,
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
          ],
        ),
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
