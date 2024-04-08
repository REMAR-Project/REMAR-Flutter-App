import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class QuestionAnswer7Page extends StatefulWidget {

  final String name;
  final String image;
  final Function(String) onIntensitySelected;

  const QuestionAnswer7Page({
    Key? key,
    required this.name,
    required this.image, required String intensity, required this.onIntensitySelected,
  }) : super(key: key);


  @override
  _QuestionAnswerPage7State createState() => _QuestionAnswerPage7State();
}

class _QuestionAnswerPage7State extends State<QuestionAnswer7Page> {
  String selectedArea = '';
  List<String> answers = [];
  String questionText = '';
  String intensity='';
  late SharedPreferences prefs;

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
    Map<String, dynamic> firstQuestionData = jsonData[6];
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
            child: Text(questionText,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Scrollbar(
                child: ListView.separated(
                  itemCount: answers.length,
                  itemBuilder: (BuildContext context, int index) {
                    return buildAnswerButton(answers[index]);
                  }, separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
                ),
              ),
            ),
          ),
        ], // Column children
      ), // Column
    );

  }

  Widget buildAnswerButton(String answer) {
    bool isSelected = answer == selectedArea;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedArea = answer;
          intensity = answer;
          widget.onIntensitySelected(intensity);

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