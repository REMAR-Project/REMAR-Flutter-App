import 'package:flutter/material.dart';
import 'package:remar_flutter_app/widgets/imports/calendar_components.dart';
import 'package:remar_flutter_app/widgets/imports/moon_calendar.dart';

class CalendarScreen extends StatelessWidget {
  final String month;
  final String year;
  final List<DateTime>? selectableDates;
  final EdgeInsets padding;
  final Function onSelection;

  const CalendarScreen({Key? key, required this.month, required this.year, this.selectableDates, required this.onSelection, this.padding = const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0)})
      : super(key: key);

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
                selectableDates: selectableDates,
                onSelection: onSelection,
              ),
            ),
          ),
        ],
      )
    );
  }
}
