import 'dart:convert';
import 'package:flutter/material.dart';

class QuestionAnswerPage extends StatefulWidget {
  @override
  _QuestionAnswerPageState createState() => _QuestionAnswerPageState();
}

class _QuestionAnswerPageState extends State<QuestionAnswerPage> {
  List<String> selectedAnswer = [];
  List<String> answers = [];
  String questionText = '';

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
    // Extract data from the first question
    Map<String, dynamic> firstQuestionData = jsonData.first;
    // Set question text and answers list
    setState(() {
      questionText = firstQuestionData['question'];
      answers = List<String>.from(firstQuestionData['answers']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Image.asset(
                  'assets/images/raster_q0_0.png',
                  height: 200,
                  width: 200,
                ),
              ),
              SizedBox(width: 20.0),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Monitoring Ucides cordatus",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Text(
            questionText,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 20.0),
          for (var answer in answers) buildAnswerButton(answer),
        ],
      ),
    );
  }

  Widget buildAnswerButton(String answer) {
    bool isSelected = answer == selectedAnswer;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAnswer = answer as List<String>;
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
