import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_bar.dart';


String month='';


void main() {

  runApp(getMonth());
}

class getMonth extends StatelessWidget {

  const getMonth({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: const CustomAppBar(),
          body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/raster_q0_0.png',
                      width: 100,
                      height: 75,
                    ),
                    const Text(
                      "Cardisoma_guanhumi",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 350,
                  height: 100,
                  child:  readJson('assets/raw_eng/questions.json',4,'questionText','',true),

                ),
                const SizedBox(
                    width: 500,
                    height: 350,
                    child: Scrollbar(
                      child: DisplayMonth(''),
                    )
                )
              ]

          ),

        ));


  }
}

class DisplayMonth extends StatefulWidget {
  const DisplayMonth(String type, {Key? key}) : super(key: key);

  String get type => '';

  @override
  _DisplayMonthState createState() => _DisplayMonthState();
}

class _DisplayMonthState extends State<DisplayMonth> {
  List<String> items = [];
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    loadYear(widget.type).then((List<String> data) {
      setState(() {
        items = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String selectedYear = selectedIndex != -1 ? items[selectedIndex] : '';
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
                month = items[selectedIndex];
                print(month);
              });
            },
          );
        },
      ),
    );
  }
}

Future<List<String>> loadYear(String type) async {
  final String json = await rootBundle.loadString('assets/raw_eng/months.json');
  final List<dynamic> data = jsonDecode(json);
  List<String> items = [];

  for (var item in data) {
    items.add(item);
  }
  return items;
}

