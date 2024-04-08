import 'package:flutter/cupertino.dart';
import 'package:remar_flutter_app/question_screens/question11.dart';
import 'package:remar_flutter_app/question_screens/question12.dart';
import 'package:remar_flutter_app/question_screens/question13.dart';
import 'package:remar_flutter_app/question_screens/question3.dart';
import 'package:remar_flutter_app/question_screens/question4.dart';


// const String crabName = "Uncides coordatus";
// const String crabImage = 'assets/images/raster_q0_0.png';
// const bool longVersion = true;

// list of answers

const String crabSpecies='Ucides cordatus';
const String crabImage='assets/images/raster_q0_0.png';


const int onDaySelected=0;
const int onStrongestDaySelected=0;
const String intensity='';
const String timeObserved='';
const String berried='';
const String habitat='';
const String state='';
const String county='';
const bool isProtectedArea=false;
const String protectedArea ='';
const String occupation='';
const bool additionalInfoShared = false;
const String additionalInfo='';

 Widget question3 = QuestionAnswer3Page(
  image: crabImage,
  name: crabSpecies,
  year: '', // Initial value of year
  onYearSelected: (String selectedYear) {
    },

);


 Widget question4 = QuestionAnswer4Page(
  image: crabImage,
  name: crabSpecies,
  month: '', // Initial value of year
  onMonthSelected: (String selectedMonth) {
      print(selectedMonth);
  },
);


String year = (question3 as QuestionAnswer3Page).year;
String month =(question4 as QuestionAnswer4Page).month;

//Add Question Pages here
List<Widget> questionsPagesList = [
  question3,
  question4,
  const QuestionAnswer11Page(image: crabImage, name: crabSpecies),
  const QuestionAnswer12Page(state: "Piauí", image: crabImage, name: crabSpecies),
  const QuestionAnswer13Page()
];

