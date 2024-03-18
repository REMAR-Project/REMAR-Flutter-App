import 'dart:convert';
import 'package:flutter/services.dart';

class Question {
  final int questionNumber;
  final String questionType;
  final String questionPicture;
  final String questionTitle;
  final String questionText;
  final String year;
  final String jsonInput;

  Question({required this.questionNumber, required this.questionType, required this.questionPicture, required this.questionTitle, required this.questionText, required this.year, this.jsonInput = ''});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      questionNumber: json['questionNumber'] ?? '',
      questionType: json['questionType'] ?? '',
      questionPicture: json['questionPicture'] ?? '',
      questionTitle: json['questionTitle'] ?? '',
      questionText: json['questionText'] ?? '',
      year: json['year'] ?? '',
      jsonInput: json['jsonInput'] ?? '',
    );
  }
}

Future<List<Question>> fetchQuestions() async {
  String jsonString = await rootBundle.loadString('assets/raw_eng/questions.json');
  List<dynamic> json = jsonDecode(jsonString);
  return json.map((question) => Question.fromJson(question)).toList();
}