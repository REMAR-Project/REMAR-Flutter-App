import 'package:flutter/material.dart';


import 'Screens/question11.dart';
import 'Screens/question12.dart';
import 'Screens/question3.dart';
import 'Screens/question4.dart';
import 'Screens/question13.dart';
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
    QuestionAnswer11Page(image: crabImage, name: crabName),
    QuestionAnswer12Page(state:"Piauí", image: crabImage, name: crabName),
    QuestionAnswer13Page()

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
