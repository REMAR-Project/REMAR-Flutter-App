import 'package:flutter/material.dart';

class QuestionAnswerPage extends StatefulWidget {
  @override
  _QuestionAnswerPageState createState() => _QuestionAnswerPageState();
}

class _QuestionAnswerPageState extends State<QuestionAnswerPage> {
  String selectedAnswer = '';

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
                  'assets/raster_q0_0.png',
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
            "Please can you let us know what you do? Touch screen and move finger to select.",
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 20.0),
          for (var answer in [
            "• I catch crabs and depend on them for my living",
            "• I catch crabs only occasionally for my own consumption",
            "• I work with crab meat processing",
            "• I work with crab commercialization",
            "• I am a local villager and do not normally catch mangrove crabs",
            "• I work for ICMBio and observed the andada myself",
            "• I work for ICMBio and report results of a crab fisher",
            "• I work for IBAMA and observed the andada myself",
            "• I work for IBAMA and report results of a crab fisher",
            "• I work in the city hall and observed the andada myself",
            "• I work in the city hall and report results of a crab fisher",
            "• I am a researcher and observed the andada myself",
            "• I am a researcher and report results of a crab fisher",
            "• I am a tourist",
            "• I work in tourism",
            "• Other",
            "• I do not want to specify"
          ])
            buildAnswerButton(answer),
        ],
      ),
    );
  }

  Widget buildAnswerButton(String answer) {
    bool isSelected = answer == selectedAnswer;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAnswer = answer;
        });
      },
      child: Container(
        color: isSelected
            ? Colors.green
            : null, // Apply green background if selected
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
