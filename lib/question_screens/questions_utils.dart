import 'package:flutter/cupertino.dart';
import 'package:remar_flutter_app/question_screens/question16.dart';
import 'package:remar_flutter_app/question_screens/question2.dart';
import 'package:remar_flutter_app/question_screens/question3.dart';
import 'package:remar_flutter_app/question_screens/question4.dart';
import 'package:remar_flutter_app/question_screens/question5.dart';
import 'package:remar_flutter_app/question_screens/question6.dart';
import 'package:remar_flutter_app/question_screens/question7.dart';
import 'package:remar_flutter_app/question_screens/question8.dart';
import 'package:remar_flutter_app/question_screens/question9.dart';
import 'package:remar_flutter_app/question_screens/question10.dart';
import 'package:remar_flutter_app/question_screens/question11.dart';
import 'package:remar_flutter_app/question_screens/question12.dart';
import 'package:remar_flutter_app/question_screens/question13.dart';
import 'package:remar_flutter_app/question_screens/question14.dart';
import 'package:remar_flutter_app/question_screens/question15.dart';


List<Widget> questionsPagesLongList() {
  return [
    const QuestionAnswer2Page(),
    const QuestionAnswer3Page(),
    const QuestionAnswer4Page(),
    const CalendarScreenQ5(),
    const CalendarScreenQ6(),
    const QuestionAnswer7Page(),
    const QuestionAnswer8Page(),
    const QuestionAnswer9Page(),
    const QuestionAnswer10Page(),
    const QuestionAnswer11Page(),
    const QuestionAnswer12Page(),
    const QuestionAnswer13Page(),
    const QuestionAnswer14Page(),
    const QuestionAnswer15Page(),
   const QuestionAnswer16Page()
  ];
}

List<Widget> questionsPagesShortList() {
  return [
    const QuestionAnswer2Page(),
    const QuestionAnswer3Page(),
    const QuestionAnswer4Page(),
    const CalendarScreenQ5(),
    const QuestionAnswer7Page(),
    const QuestionAnswer11Page(),
    const QuestionAnswer12Page(),
    const QuestionAnswer13Page(),
    const QuestionAnswer14Page(),
    const QuestionAnswer15Page(),
  ];
}



