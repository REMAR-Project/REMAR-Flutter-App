import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remar_flutter_app/widgets/imports/calendar_components.dart';
import 'package:remar_flutter_app/widgets/imports/moon_calendar.dart';
import 'package:remar_flutter_app/global.dart';

/// A screen that displays a calendar with moon phases and selectable dates.
class CalendarScreenQ6 extends StatelessWidget {
  // final String month;
  // final String year;
  // final List<DateTime> selectableDates;
  // final Function onSelection;
  final EdgeInsets padding;

  /// Constructs a [CalendarScreenQ6] widget.
  ///
  /// The [padding] parameter specifies the padding around the calendar screen.
  const CalendarScreenQ6({
    super.key,
    // required this.month,
    // required this.year,
    // required this.selectableDates,
    // required this.onSelection,
    this.padding = const EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
  });

  // Temporary function to retrofit the question into the global variable system
  void handleSelection(List<DateTime> value) {
    Q6selectedDate = value;
  }

  Future<String> loadQuestions() async {
    //enableForwardNavigation = false;
    String jsonString = await rootBundle.loadString('assets/raw_eng/questions2Modified.json');
    List<dynamic> jsonData = jsonDecode(jsonString);
    Map<String, dynamic> firstQuestionData = jsonData[5];
    return firstQuestionData['questionText'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 20),
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
                selectableDates: Q5selectedDates,
                onSelection: handleSelection,
              ),
            ),
          ),
        ],
      )
    );
  }
}
