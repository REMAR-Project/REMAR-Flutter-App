import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DisplayMonthYear extends StatefulWidget {
  final String type;


  const DisplayMonthYear(this.type, {Key? key})
      : super(key: key);

  @override
  _DisplayMonthYearState createState() => _DisplayMonthYearState();
}

class _DisplayMonthYearState extends State<DisplayMonthYear> {
  List<String> items = [];
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    loadMontYear(widget.type)
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

Future<List<String>> loadMontYear(String type) async {



  String fileName='';
  if(type=="Year") {
    fileName='assets/raw_eng/years.json';
  }
  else if(type=="Month") {
    fileName='assets/raw_eng/months.json';
  }

  print(fileName);

  final String json = await rootBundle.loadString(fileName);
  final List<dynamic> data = jsonDecode(json);
  List<String> items = [];

  for (var item in data) {
      items.add(item);
    }
  return items;
  }
