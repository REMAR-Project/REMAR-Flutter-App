import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:remar_flutter_app/global.dart';



class QuestionAnswer8Page extends StatefulWidget {


  const QuestionAnswer8Page({
    super.key,
  });


  @override
  _QuestionAnswerPage8State createState() => _QuestionAnswerPage8State();
}

class _QuestionAnswerPage8State extends State<QuestionAnswer8Page> {
  String selectedArea = '';
  List<String> answers = [];
  String questionText = '';
  int selectedIndex = -1;

  List<Map<String, String>> options = [
    {"name": "Only at day", "url": "assets/images/ic_d_day.png"},
    {"name": "Only at night", "url": "assets/images/ic_d_night.png"},
    {"name": "At day and night", "url": "assets/images/ic_d_daynight.png"},
    {"name": "I did not look", "url": "assets/images/ic_d_question.png"},
  ];

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  void loadQuestions() async {

    enableForwardNavigation = false;

    if(backwardsNavigation==true) {
      enableForwardNavigation =true;
    }

    // Load the JSON data from the file
    String jsonString = await DefaultAssetBundle.of(context)
        .loadString('assets/raw_eng/questions2Modified.json');

    // Parse the JSON string into a list of objects
    List<dynamic> jsonData = jsonDecode(jsonString);

    // Extract data from the first question (question number 9)
    Map<String, dynamic> firstQuestionData = jsonData[7];
    print(firstQuestionData);
    // Set question text and answers list
    setState(() {
      questionText = firstQuestionData['description'];
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
                selectedCrabSpeciesImage,
                width: 100,
                height: 125,
              ),
              Text(
                selectedCrabSpecies,
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
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    int crossAxisCount = constraints.maxWidth < 600 ? 2 : 4;
                    return GridView.builder(
                      itemCount: options.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        childAspectRatio: 2,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                              selectedArea = options[selectedIndex]["name"]!;
                              timeObserved = selectedArea;
                              enableForwardNavigation =true;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(1.0),
                            margin: const EdgeInsets.symmetric(vertical: 1.0),
                            decoration: BoxDecoration(
                              color: selectedIndex == index
                                ? Colors.green
                                : (backwardsNavigation && options[index]["name"] == timeObserved ? Colors.green : null),
                                borderRadius: BorderRadius.circular(25)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  options[index]["name"]!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Flexible(
                                  child: Image.asset(
                                    options[index]["url"]!,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ], // Column children
      ), // Column
    );

  }

}
