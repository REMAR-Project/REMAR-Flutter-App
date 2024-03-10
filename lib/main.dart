import 'package:flutter/material.dart';
import 'app_bar.dart';
import 'bottom_navigation_bar.dart';
import 'question9.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: CustomAppBar(),
        bottomNavigationBar: CustomBottomNavigationBar(),
        body: QuestionAnswer9Page(),
      ),
    );
  }
}
