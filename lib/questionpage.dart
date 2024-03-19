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
  Map<int, dynamic> answers = {};

  @override
  void initState() {
    super.initState();
    fetchQuestions().then((fetchedQuestions) {
      setState(() {
        questions = fetchedQuestions;
      });
    });
  }

  void handleSelection(dynamic value) {
  setState(() {
    answers[currentQuestionNumber] = value;
    print(currentQuestionNumber);
    print(value);
    if (currentQuestionNumber < questions.length) {
      currentQuestionNumber++;
    } else {
      // show submit page
    }
  });
}

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      return const CircularProgressIndicator();
    } else {
      Question currentQuestion = questions.firstWhere((question) => question.questionNumber == currentQuestionNumber);
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
                case 'DateRange':
                  questionWidget = MoonCalendar(key: Key(currentQuestionNumber.toString()));
                  break;
                case 'ListSelect':
                  questionWidget = ListSelection(key: Key(currentQuestionNumber.toString()), fileName: currentQuestion.jsonInput, onSelection: handleSelection);
                  break;
                case 'YearChoice':
                  questionWidget = YearMonthSelection(key: Key(currentQuestionNumber.toString()), type: 'Year', onSelection: handleSelection);
                  break;
                case 'MonthChoice':
                  questionWidget = YearMonthSelection(key: Key(currentQuestionNumber.toString()), type: 'Month', year: int.parse(answers[currentQuestion.questionNumber-1]) , onSelection: handleSelection);
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
}