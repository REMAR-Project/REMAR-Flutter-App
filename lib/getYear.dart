import 'package:flutter/material.dart';
import 'package:remar_flutter_app/displaylist.dart';
import 'app_bar.dart';
import 'bottom_navigation_bar.dart';
import 'Strings_english.dart';

String fileName='assets/raw_eng/questions.json';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    DisplayList(fileName);
    return MaterialApp(
      home: Scaffold(
        appBar: const CustomAppBar(),
        bottomNavigationBar: const CustomBottomNavigationBar(),
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
                  Strings.monitoring_Cardisoma_guanhumi,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            const SizedBox(
              width: 350,
                child: Text(Strings.choose_year_instruction,
              style: TextStyle(fontSize: 15),
              )
            ),
            SizedBox(
              height: 575,
              child: Scrollbar(
                  child:  DisplayList(fileName),
              ),


            )
  ]

      ),

    ));


  }
}
