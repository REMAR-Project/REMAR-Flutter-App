import 'package:flutter/material.dart';
import 'package:remar_flutter_app/question7.dart';
import 'package:remar_flutter_app/question8.dart';
import 'package:remar_flutter_app/question9.dart';
import 'package:remar_flutter_app/questions.dart';
import 'package:remar_flutter_app/questions3.dart';
import 'package:remar_flutter_app/questions4.dart';
import 'app_bar.dart';
import 'bottom_navigation_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();}

String crabName="Uncides coordatus";
String crabImage='assets/images/raster_q0_0.png';
bool longVersion=true;

class _MyAppState extends State<MyApp> {
  int _currentPageIndex = 0; // Current page index

  final List<Widget> _pages = [
    QuestionAnswer3Page(image: crabImage, name: crabName),
    QuestionAnswer4Page(image: crabImage, name: crabName),
    QuestionAnswer7Page(),
    QuestionAnswer8Page(state:"Piauí", image: crabImage, name: crabName),
    QuestionAnswer9Page(), // Page 1
    QuestionAnswerPage(), // Page 2
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: const CustomAppBar(),
        bottomNavigationBar: CustomBottomNavigationBar(
          currentPageIndex: _currentPageIndex,
          onPageChanged: _onPageChanged,
        ),
        body: _pages[_currentPageIndex],
      ),
    );
  }
}
