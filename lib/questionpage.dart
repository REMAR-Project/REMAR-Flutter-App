// DIsplays widgets based on the information gathered from the question.json file
import 'package:flutter/material.dart';
import 'package:remar_flutter_app/imports/question.dart';
import 'package:remar_flutter_app/imports/widgetImports.dart';
import 'package:remar_flutter_app/widgets/app_bar.dart';
import 'package:remar_flutter_app/widgets/bottom_navigation_bar.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int currentQuestionNumber = 1;
  List<Question> questions = [];

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: const CustomAppBar(),
    body: FutureBuilder<List<Question>>(
      future: fetchQuestions(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          questions = snapshot.data!;
          Question currentQuestion = questions.firstWhere((question) => question.questionNumber == currentQuestionNumber);
          Widget questionWidget;
          switch (currentQuestion.questionType) {
            // TODO: Add all possible question types
            case 'MoonCalendar':
              questionWidget = const MoonCalendar();
              break;
            case 'ListSelect':
              questionWidget = ListSelection(fileName: currentQuestion.jsonInput);
              break;
            case 'YearChoice':
              questionWidget = const YearMonthSelection(type: 'Year');
              break;
            case 'MonthChoice':
              questionWidget = const YearMonthSelection(type: 'Month', year: 2021);
              break;
            default:
              questionWidget = const Text('QUESTION TYPE YET TO BE COMPLETED');
          }
          return Column(
            children: [
              Text(currentQuestion.questionText),
              Expanded(
                child: questionWidget,
              ),
              CustomBottomNavigationBar(
                onNext: () async {
                  if (currentQuestionNumber < questions.length) {
                    var result = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListSelection(fileName: currentQuestion.jsonInput)),
                    );
                    print('Received from ListSelection: $result');
                    // Use the result here
                  }
                },
                onPrevious: () {
                  if (currentQuestionNumber > 1) {
                    setState(() {
                      currentQuestionNumber--;
                    });
                  }
                },
                currentPage: currentQuestionNumber,
                totalPages: questions.length,
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return const CircularProgressIndicator();
        }
      },
    ),
  );
}
}