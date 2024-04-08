import 'package:flutter/material.dart';

class YearMonthSelection extends StatefulWidget {
  final String type;
  final int? year;
  final Function onSelection;

  const YearMonthSelection({Key? key, required this.type, this.year, required this.onSelection}) : super(key: key);

  @override
  _YearMonthSelectionState createState() => _YearMonthSelectionState();
}

class _YearMonthSelectionState extends State<YearMonthSelection> {
  List<String> items = [];

  @override
  void initState() {
    super.initState();
    if (widget.type == 'Year') {
      generateYears();
    } else if (widget.type == 'Month') {
      generateMonths();
    }
  }

  void generateYears() {
    int currentYear = DateTime.now().year;
    for (int i = currentYear; i >= 2019; i--) {
      items.add(i.toString());
    }
  }

  void generateMonths() {
    int currentYear = DateTime.now().year;
    int currentMonth = DateTime.now().month;
    List<String> months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];

    if (widget.year == currentYear) {
      months = months.take(currentMonth).toList();
    }

    items = months;
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Center(
                child: Text(items[index]),
              ),
              onTap: () {
                widget.onSelection(items[index]);
              },
            ),
          );
        },
      ),
    );
  }
}