import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remar_flutter_app/getYear.dart';

class DisplayList extends StatefulWidget {
  const DisplayList(fileName, {Key? key}) : super(key: key);

  @override
  _DisplayListState createState() => _DisplayListState();
}

class _DisplayListState extends State<DisplayList> {
  List<String> items = [];
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    loadJson(fileName).then((List<String> data) {
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

Future<List<String>> loadJson(String fileName) async {
  final String json = await rootBundle.loadString(fileName);
  final List<dynamic> data = jsonDecode(json);
  return data.cast<String>();
}