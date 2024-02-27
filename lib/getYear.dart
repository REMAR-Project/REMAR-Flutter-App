import 'package:flutter/material.dart';
import 'package:remar_flutter_app/questions.dart';
import 'app_bar.dart';
import 'bottom_navigation_bar.dart';
import 'package:remar_flutter_app/GetYearMonth.dart';

String fileName_questions='assets/raw_eng/questions.json';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
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
                  "Cardisoma_guanhumi",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(
              width: 350,
              height: 100,
              child:  DisplayQuestions(fileName_questions,3,'questionText'),

            ),
            const SizedBox(
              width: 500,
              height: 500,
              child: Scrollbar(
                child: DisplayMonthYear("Year"),
              )

            ),

      ]

      ),

    ));


  }
}
