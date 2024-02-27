import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DisplayList extends StatefulWidget {
  final String fileName;
  final int number;
  final String value;

  const DisplayList(this.fileName, this.number, this.value, {Key? key})
      : super(key: key);

  @override
  _DisplayListState createState() => _DisplayListState();
}

class _DisplayListState extends State<DisplayList> {
  List<String> items = [];
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    loadQuestionData(widget.fileName, widget.number, widget.value)
        .then((List<String> data) {
      setState(() {
        items = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              items[index],
              style: TextStyle(
                color: index == selectedIndex ? Colors.green : Colors.black,
              ),
            ),
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
          );
        },
      ),
    );
  }
}

Future<List<String>> loadQuestionData(String fileName, int number, String value) async {
  final String json = await rootBundle.loadString(fileName);
  final List<dynamic> data = jsonDecode(json);
  List<String> items = [];

  for (var item in data) {
    if (item['questionNumber'] == number) {
      items.add(item[value].toString());
    }
  }
  return items;
}
