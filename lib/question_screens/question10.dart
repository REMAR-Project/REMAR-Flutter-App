import 'dart:convert';
import 'package:flutter/material.dart';

class QuestionAnswerPage extends StatefulWidget {
  const QuestionAnswerPage({super.key});

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
    // Extract data from the question with questionNumber 10
    Map<String, dynamic>? question10Data = jsonData.firstWhere(
        (question) => question['questionNumber'] == 10,
        orElse: () => null);

    if (question10Data != null) {
      // Extract question and answers
      String? question = question10Data['question_10'];
      List<dynamic>? answersList = question10Data['answers_10'];

      if (question != null && answersList != null) {
        setState(() {
          questionText = question;
          answers = answersList.cast<String>(); // Cast answers to String list
        });
      }
    }
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
                  'assets/images/raster_q0_0.png',
                  height: 200,
                  width: 200,
                ),
              ),
              const SizedBox(width: 20.0),
              const Expanded(
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
    bool isSelected = selectedAnswer.contains(answer);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedAnswer.remove(answer);
          } else {
            selectedAnswer.clear();
            selectedAnswer.add(answer);
          }
        });
      },
      child: Container(
        color: isSelected ? Colors.green : null,
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