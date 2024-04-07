import 'package:flutter/cupertino.dart';
import 'package:remar_flutter_app/question_screens/question11.dart';
import 'package:remar_flutter_app/question_screens/question12.dart';
import 'package:remar_flutter_app/question_screens/question13.dart';
import 'package:remar_flutter_app/question_screens/question3.dart';
import 'package:remar_flutter_app/question_screens/question4.dart';

const String crabName = "Uncides coordatus";
const String crabImage = 'assets/images/raster_q0_0.png';
const bool longVersion = true;

// Add Question Pages here
const List<Widget> questionsPagesList = [
  QuestionAnswer3Page(image: crabImage, name: crabName),
  QuestionAnswer3Page(image: crabImage, name: crabName),
  QuestionAnswer4Page(image: crabImage, name: crabName),
  QuestionAnswer11Page(image: crabImage, name: crabName),
  QuestionAnswer12Page(state: "Piauí", image: crabImage, name: crabName),
  QuestionAnswer13Page()
];
