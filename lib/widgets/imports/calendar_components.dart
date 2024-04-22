import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remar_flutter_app/widgets/imports/calendar_components.dart';
import 'package:remar_flutter_app/widgets/imports/moon_calendar.dart';
import 'package:remar_flutter_app/global.dart';

/// A screen that displays a calendar with moon phases and selectable dates.
class CalendarScreenQ5 extends StatelessWidget {
  final EdgeInsets padding;

  /// Constructs a [CalendarScreenQ5] widget.
  ///
  /// The [padding] parameter specifies the padding around the calendar screen.
  const CalendarScreenQ5({
    Key? key,
    this.padding = const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
  }) : super(key: key);

  // Temporary function to retrofit the question into the global variable system
  void onSelection(List<DateTime> value) {
    Q5selectedDates = value;
  }

  Future<String> loadQuestions() async {
    String jsonString = await rootBundle.loadString('assets/raw_eng/questions2Modified.json');
    List<dynamic> jsonData = jsonDecode(jsonString);
    Map<String, dynamic> firstQuestionData = jsonData[4];
    return firstQuestionData['questionText'];
  }

class QuestionText extends StatelessWidget {
  final String questionText;

  const QuestionText({Key? key, required this.questionText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.15,
      child: Text(
        questionText,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}

class DayOfWeekHeaders extends StatelessWidget {
  static const List<String> daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  const DayOfWeekHeaders({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          FutureBuilder<String>(
            future: loadQuestions(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return QuestionText(questionText: snapshot.data!);
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return const Text('Error loading question');
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
          Padding(
            padding: padding,
            child: Header(month: month, year: year),
          ),
          Padding(
            padding: padding,
            child: const MoonPhaseKey(),
          ),
          Padding(
            padding: padding,
            child: const DayOfWeekHeaders(),
          ),
          Expanded(
            child: Padding(
              padding: padding,
              child: MoonCalendar(
                month: month,
                year: year,
                onSelection: onSelection,
              ),
            ),
          ),
        ],
      )
    );
  }
}
