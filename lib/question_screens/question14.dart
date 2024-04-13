import 'dart:convert';
import 'package:flutter/material.dart';

class QuestionAnswer14Page extends StatefulWidget {

  final String name;
  final String image;
  final String occupation;
  final Function(String) onOccupationSelected;

  const QuestionAnswer14Page({
    Key? key,
    required this.name,
    required this.image,
    required this.occupation,
    required this.onOccupationSelected,
  }) : super(key: key);

  @override
  _QuestionAnswerPage14State createState() => _QuestionAnswerPage14State();
}

class _QuestionAnswerPage14State extends State<QuestionAnswer14Page> {
  String selectedArea = '';
  List<String> selectedAnswer = [];
  List<String> answers = [];
  String questionText = '';
  String occupation='';

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
    Map<String, dynamic> firstQuestionData = jsonData[13];


    // Set question text and answers list
    setState(() {
      questionText = firstQuestionData['question_10'];

      // Extract answers from the answers map
      List<dynamic> answerList = firstQuestionData['answers_10'];

      // Cast answers to List<String>
      answers = answerList.map((answer) => answer.toString()).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Image.asset(
                  widget.image,
                  width: 100,
                  height: 125,
                ),
              ),
              const SizedBox(width: 20.0),
               Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Text(
            questionText,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
          const SizedBox(height: 20.0),
          for (var answer in answers) buildAnswerButton(answer),
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
          occupation = answer;
          widget.onOccupationSelected(occupation);
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