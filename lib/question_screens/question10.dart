import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:remar_flutter_app/global.dart';


class QuestionAnswer10Page extends StatefulWidget {

  final String name;
  final String image;
  final String habitat;
  final Function(String) onHabitatSelected;

  const QuestionAnswer10Page({
    Key? key,
    required this.name,
    required this.image, required this.habitat, required this.onHabitatSelected,
  }) : super(key: key);


  @override
  _QuestionAnswerPage10State createState() => _QuestionAnswerPage10State();
}

class _QuestionAnswerPage10State extends State<QuestionAnswer10Page> {
  String selectedArea = '';
  List<String> answers = [];
  String questionText = '';
  String habitat='';
  String answer='';

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
    Map<String, dynamic> firstQuestionData = jsonData[9];

    if(widget.name=="Ucides cordatus") {
      answer='answers_0';
    }
    else {
      answer='answers_1';
    }


    // Set question text and answers list
    setState(() {
      questionText = firstQuestionData['description'];

      // Extract answers from the answers map
      List<dynamic> answerList = firstQuestionData[answer];

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
          habitat = answer;
          widget.onHabitatSelected(habitat);
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

