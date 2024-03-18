import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ListSelection extends StatefulWidget {
  final String fileName;

  const ListSelection({super.key, required this.fileName});

  @override
  _ListSelectionState createState() => _ListSelectionState();
}

class _ListSelectionState extends State<ListSelection> {
  List<String> items = [];

  @override
  void initState() {
    super.initState();
    readJson();
  }

void readJson() async {
  final String response = await rootBundle.loadString('assets/raw_eng/${widget.fileName}');
  final data = await json.decode(response);
  print('Parsed data: $data');
  setState(() {
    items = List<String>.from(data);
  });
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
                print('Item clicked: ${items[index]}');
                Navigator.pop(context, items[index]); // pass data back
              },
            ),
          );
        },
      ),
    );
  }
}