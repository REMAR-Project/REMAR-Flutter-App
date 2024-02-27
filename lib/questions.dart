import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DisplayQuestions extends StatefulWidget {
  final String fileName;
  final int number;
  final String value;

  const DisplayQuestions(this.fileName, this.number, this.value, {Key? key})
      : super(key: key);

  @override
  _DisplayQuestionsState  createState() => _DisplayQuestionsState();
}

class _DisplayQuestionsState extends State<DisplayQuestions> {
  List<String> items = [];


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
              style: const TextStyle(
              ),
            ),

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