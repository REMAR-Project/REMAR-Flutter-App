import 'package:flutter/material.dart';
import 'package:remar_flutter_app/dipslaylist.dart';
import 'Strings_english.dart';

class DisplayList extends StatefulWidget {
  const DisplayList({super.key, required List<String> arrayList});

  @override
  _DisplayList createState() => _DisplayList();
}

class  _DisplayList  extends State<DisplayList> {
  List<String> items = arrayList;
  int selectedIndex =-1;

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

