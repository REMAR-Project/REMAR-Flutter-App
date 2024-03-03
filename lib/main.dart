import 'package:flutter/material.dart';
import 'widgets/app_bar.dart';
import 'questionpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          appBar: const CustomAppBar(),
          body: Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuestionPage()),
                );
              },
              child: Text('Go to QuestionPage'),
            ),
          ),
        ),
      ),
    );
  }
}