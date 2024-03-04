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
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWeight = MediaQuery.of(context).size.width;
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
                      width: sizeWeight * 0.3,
                      height: sizeHeight * 0.1,
                    ),
                    const Text(
                      "Cardisoma_guanhumi",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(
                  width: sizeWeight * 1.0,
                  height: sizeHeight * 0.2,
                  child:  DisplayQuestions(fileName_questions,4,'questionText'),

                ),
                SizedBox(
                    width: sizeWeight * 1.0,
                    height: sizeHeight * 0.5,
                    child: const Scrollbar(
                      child: DisplayMonthYear("Month"),
                    )

                ),

              ]

          ),

        ));


  }
}