import 'package:flutter/material.dart';
import 'package:remar_flutter_app/imports/question.dart';
import 'package:remar_flutter_app/imports/widgetImports.dart';
import 'package:remar_flutter_app/widgets/app_bar.dart';
import 'package:remar_flutter_app/widgets/bottom_navigation_bar.dart';

class QuestionPage extends StatefulWidget {
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
              case 'YearChoice':
                questionWidget = const MoonCalendar();
                break;
              case 'MonthChoice':
                questionWidget = const MoonCalendar();
                break;
              default:
                questionWidget = MoonCalendar();
            }
            return Column(
              children: [
                Text(currentQuestion.questionText),
                questionWidget,
              ],
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
      bottomNavigationBar: questions != null ? CustomBottomNavigationBar(
        onNext: () {
          if (currentQuestionNumber < questions.length) {
            setState(() {
              currentQuestionNumber++;
            });
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
      ) : null,
    );
  }
}