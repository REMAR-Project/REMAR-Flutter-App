import 'package:flutter/material.dart';
import 'package:remar_flutter_app/widgets/imports/calendar_components.dart';
import 'package:remar_flutter_app/widgets/imports/moon_calendar.dart';
import 'package:remar_flutter_app/global.dart';

/// A screen that displays a calendar with moon phases and selectable dates.
class CalendarScreenQ5 extends StatelessWidget {
  // final String month;
  // final String year;
  // final List<DateTime> selectableDates;
  //final Function onSelection;
  final EdgeInsets padding;

  /// Constructs a [CalendarScreenQ5] widget.
  ///
  /// The [padding] parameter specifies the padding around the calendar screen.
  const CalendarScreenQ5({
    Key? key,
    // required this.month,
    // required this.year,
    // required this.selectableDates,
    // required this.onSelection,
    this.padding = const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
  }) : super(key: key);

  // Temporary function to retrofit the question into the global variable system
  void onSelection(List<DateTime> value) {
    selectedDates = value;
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
                selectableDates: null,
                onSelection: onSelection,
              ),
            ),
          ),
        ],
      )
    );
  }
}
