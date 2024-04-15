import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:remar_flutter_app/question_screens/global.dart';


class QuestionAnswer11Page extends StatefulWidget {

  final String name;
  final String image;
  final String state;
  final Function(String) onStateSelected;

  const QuestionAnswer11Page({
    Key? key,
    required this.name,
    required this.image,
    required this.onStateSelected, required this.state,
  }) : super(key: key);


  @override
  _QuestionAnswerPage11State createState() => _QuestionAnswerPage11State();
}

class _QuestionAnswerPage11State extends State<QuestionAnswer11Page> {
  String selectedArea = '';
  List<String> answers = [];
  String questionText = '';
  String state='';

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
    Map<String, dynamic> firstQuestionData = jsonData[10];


    // Set question text and answers list
    setState(() {
      questionText = firstQuestionData['description'];

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
              child: Text(questionText,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height *0.4,
              width: MediaQuery.of(context).size.width * 0.6,
              child: Scrollbar(
                child: ListView.separated(
                  controller: ScrollController(),
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
          state = answer;
          widget.onStateSelected(state);
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
