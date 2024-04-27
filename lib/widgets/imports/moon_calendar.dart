import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import 'package:intl/intl.dart';
import 'package:remar_flutter_app/global.dart';

/// A widget that displays a moon calendar for a specific month and year.
class MoonCalendar extends StatefulWidget {
  final String month;
  final String year;
  final List<DateTime>? selectableDates;
  final Function onSelection;

  const MoonCalendar({
    super.key,
    required this.month,
    required this.year,
    required this.onSelection,
    this.selectableDates,
  });

  @override
  _MoonCalendarState createState() => _MoonCalendarState();
}

class _MoonCalendarState extends State<MoonCalendar> {
  List<DateTime> selectedDates = [];
  late int daysInMonth;
  late int firstDayOfWeek;
  List<DateTime> newMoonDates = [];
  List<DateTime> fullMoonDates = [];
  late List<DateTime> trailingDates;
  late List<DateTime> leadingDates;

  /// Checks if a given date is within the current month and year.
  bool _isDateWithinCurrentMonth(DateTime date) {
    int monthInt = _getMonthInt(widget.month);
    int yearInt = int.parse(widget.year);
    return date.month == monthInt && date.year == yearInt;
  }

  /// Checks if a given date is within the selected dates.
  bool _isDateWithinSelectedDates(DateTime date) {
    return Q5selectedDates.any((selectedDate) => 
      selectedDate.year == date.year && 
      selectedDate.month == date.month && 
      selectedDate.day == date.day);
  }

  @override
  void initState() {
    super.initState();
    enableForwardNavigation = false;

    if(backwardsNavigation==true) {
      enableForwardNavigation =true;
    }


    // Assumes Q5 if not set
    if (widget.selectableDates == null || widget.selectableDates!.isEmpty) {
      selectedDates = Q5selectedDates.where(_isDateWithinCurrentMonth).toList();
      Q5selectedDates = selectedDates;
      enableForwardNavigation = true;
    }else{
      if (Q6selectedDate.isNotEmpty && _isDateWithinSelectedDates(Q6selectedDate.first)) {
        selectedDates = Q6selectedDate.where(_isDateWithinCurrentMonth).toList();
        enableForwardNavigation = true;
      }
      Q6selectedDate = selectedDates;
    }
    if (selectedDates.isNotEmpty) {
      enableForwardNavigation = true;
    }
    else if(selectedDates.isEmpty) {
      enableForwardNavigation = false;
    }
    daysInMonth = _getDaysInMonth();
    firstDayOfWeek = _getFirstDayOfWeek();
    _loadMoonPhases();
    _calculateTrailingAndLeadingDates();
  }

  /// Loads the moon phases from CSV files.
  Future<void> _loadMoonPhases() async {
    // Load and parse the new moons CSV.
    final newMoonCsvData = await _loadCsvData('assets/moons/moons_new.csv');
    final fullMoonCsvData = await _loadCsvData('assets/moons/moons_full.csv');

    setState(() {
      newMoonDates = _parseMoonCsv(newMoonCsvData);
      fullMoonDates = _parseMoonCsv(fullMoonCsvData);
    });
  }

  /// Loads CSV data from a given path.
  Future<List<List<dynamic>>> _loadCsvData(String path) async {
    final csvString = await rootBundle.loadString(path);
    // Split the file content by new lines to ensure that each date is a separate entry.
    var lines = csvString.split('\n');
    List<List<dynamic>> rows = [];

    for (var line in lines) {
      // Skip empty lines.
      if (line.trim().isEmpty) continue;
      
      // Remove carriage return if present.
      line = line.replaceAll('\r', '');

      // Use the CSV parser to parse the individual line.
      var row = const CsvToListConverter().convert(line).first;
      rows.add(row);
    }
    return rows;
  }

  /// Parses the moon phase data from CSV into DateTime objects.
  List<DateTime> _parseMoonCsv(List<List<dynamic>> csvData) {
    List<DateTime> moonDates = [];

    for (var data in csvData) {
      try {
        // Trim the strings to remove any leading/trailing whitespace.
        int day = int.parse(data[0].toString().trim());
        int month = int.parse(data[1].toString().trim());
        int year = int.parse(data[2].toString().trim());
        moonDates.add(DateTime(year, month, day));
      } catch (e) {
        print('Error parsing moon phase data: $e');
      }
    }

    return moonDates;
  }

  /// Gets the number of days in the current month.
  int _getDaysInMonth() {
    int monthInt = _getMonthInt(widget.month);
    int yearInt = int.parse(widget.year);
    return DateUtils.getDaysInMonth(yearInt, monthInt);
  }

  /// Gets the integer representation of a month.
  int _getMonthInt(String month) {
    return List<String>.of([
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ]).indexOf(month) + 1;
  }

  /// Gets the first day of the week for the current month.
  int _getFirstDayOfWeek() {
    int yearInt = int.parse(widget.year);
    int monthInt = _getMonthInt(widget.month);
    DateTime firstOfMonth = DateTime(yearInt, monthInt, 1);
    return (firstOfMonth.weekday % 7);
  }

  /// Calculates the trailing and leading dates for the calendar grid.
  void _calculateTrailingAndLeadingDates() {
    int yearInt = int.parse(widget.year);
    int monthInt = _getMonthInt(widget.month);

    int firstDayOfWeek = _getFirstDayOfWeek();

    // Calculate the number of days from the last month to display.
    int previousMonth = monthInt == 1 ? 12 : monthInt - 1;
    int previousYear = monthInt == 1 ? yearInt - 1 : yearInt;
    int daysInPreviousMonth = DateUtils.getDaysInMonth(previousYear, previousMonth);
    
    // If the first day of the month is a Sunday, no trailing dates are needed.
    int daysFromLastMonth = firstDayOfWeek;
    trailingDates = List.generate(daysFromLastMonth, (index) {
      return DateTime(previousYear, previousMonth, daysInPreviousMonth - (daysFromLastMonth - index - 1));
    });

    // Calculate the number of cells in the grid to fill with the dates of the current and next month.
    int totalCells = 42; // 6 rows * 7 days
    int currentAndTrailingCount = daysInMonth + trailingDates.length;
    int leadingCount = totalCells - currentAndTrailingCount;

    // Calculate leading dates for the next month.
    leadingDates = List.generate(leadingCount, (index) {
      int nextMonth = monthInt == 12 ? 1 : monthInt + 1;
      int nextYear = monthInt == 12 ? yearInt + 1 : yearInt;
      return DateTime(nextYear, nextMonth, index + 1);
    });
  }

  /// Builds a day item widget for the calendar grid.
  Widget _buildDayItem(int index) {
    // Determine if the index falls in the trailing, current, or leading dates range.
    DateTime currentDate;
    bool isTrailingDate = index < trailingDates.length;
    bool isLeadingDate = index >= trailingDates.length + daysInMonth;

    if (isTrailingDate) {
      // Trailing date from the previous month.
      currentDate = trailingDates[index];
    } else if (isLeadingDate) {
      // Leading date from the next month.
      currentDate = leadingDates[index - trailingDates.length - daysInMonth];
    } else {
      // Date from the current month.
      int dayNumber = index + 1 - trailingDates.length;
      currentDate = DateTime(int.parse(widget.year), _getMonthInt(widget.month), dayNumber);
    }

    bool isCurrentMonthDate = !isTrailingDate && !isLeadingDate;
    bool isNewPhase = newMoonDates.contains(currentDate);
    bool isFullPhase = fullMoonDates.contains(currentDate);

    bool isSelectable = _isDateSelectable(currentDate);

    TextStyle textStyle = TextStyle(
      fontSize: 24,
      color: isSelectable && isCurrentMonthDate ? Colors.black : Colors.grey,
    );

    return GestureDetector(
      onTap: isSelectable
        ? () {
            setState(() {
              if (widget.selectableDates == null || widget.selectableDates!.isEmpty || enableForwardNavigation == true) {
                if (selectedDates.contains(currentDate)) {
                  selectedDates.remove(currentDate);
                  if(selectedDates.isEmpty){
                  enableForwardNavigation = false;
                  backwardsNavigation = false;
                  }
                } else {
                  selectedDates.add(currentDate);
                  enableForwardNavigation = true;
                  backwardsNavigation = false;

                }
              } else {
                selectedDates.clear();
                selectedDates.add(currentDate);
                enableForwardNavigation = true;
                enableForwardNavigation = true;
                backwardsNavigation = false;
              }
              widget.onSelection(selectedDates);
            });
          }
        : null,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1.0),
          color: selectedDates.contains(currentDate) ? Colors.green : Colors.white,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Text(
              DateFormat('d').format(currentDate),
              style: textStyle,
            ),
            // Show moon phase icons if it's a current month date and has a phase
            if (isCurrentMonthDate && isNewPhase)
              const Positioned(
                right: 0,
                top: 0,
                child: Icon(
                  Icons.circle,
                    color: Color.fromARGB(255, 100, 100, 100) // New moon color
                ),
              ),
            if (isCurrentMonthDate && isFullPhase)
              const Positioned(
                right: 0,
                top: 0,
                child: Icon(
                  Icons.circle,
                  color: Color.fromARGB(255, 255, 255, 0), // Full moon color
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int totalItemCount = trailingDates.length + daysInMonth + leadingDates.length;
    return Expanded(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600), // Set your desired max width here
          child: SafeArea(
            top: false,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
              ),
              itemCount: totalItemCount,
              itemBuilder: (context, index) {
                return _buildDayItem(index);
              },
            ),
          ),
        ),
      ),
    );
  }

  /// Checks if a given date is selectable.
  bool _isDateSelectable(DateTime date) {
    return widget.selectableDates == null || widget.selectableDates!.contains(date);
  }
}
