import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Strings_english.dart';

class ListYears extends StatefulWidget {
  const ListYears({super.key});

  @override
  _ListYears createState() => _ListYears();
}

class _ListYears extends State<ListYears> {
  List<String> items = Strings.years;
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