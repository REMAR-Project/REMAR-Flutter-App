// main.dart
import 'package:flutter/material.dart';
import 'crab_questions.dart';
import 'app_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: CustomAppBar(),
        body: CrabQuestionsPage(),
      ),
    );
  }
}
