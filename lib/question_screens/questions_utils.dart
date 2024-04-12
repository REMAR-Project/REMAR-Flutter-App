import 'package:flutter/cupertino.dart';
import 'package:remar_flutter_app/question_screens/question11.dart';
import 'package:remar_flutter_app/question_screens/question12.dart';
import 'package:remar_flutter_app/question_screens/question13.dart';
import 'package:remar_flutter_app/question_screens/question3.dart';
import 'package:remar_flutter_app/question_screens/question4.dart';
import 'package:remar_flutter_app/question_screens/question7.dart';
import 'package:remar_flutter_app/question_screens/question9.dart';
import 'package:remar_flutter_app/question_screens/question16.dart';



// list of answers

const String crabSpecies = 'Ucides cordatus';
const String crabImage = 'assets/images/raster_q0_0.png';

// Define initial values for various properties
String year = '';
String month = '';
String state = '';
String county = '';
String intensity ='';
String berried='';

// Define callback functions for updating the properties
void onYearSelected(String selectedYear) {
  year = selectedYear;
}

void onMonthSelected(String selectedMonth) {
  month = selectedMonth;
}

void onIntensitySelected(String selectedIntensity) {
  intensity = selectedIntensity;
}

void onStateSelected(String selectedState) {
  state = selectedState;
}

void onCountySelected(String selectedCounty) {
  county = selectedCounty;
}

void onBerriedSelected(String selectedBerried) {
  berried = selectedBerried;
}


// Create instances of question widgets with callback functions
Widget question3 = QuestionAnswer3Page(
  image: crabImage,
  name: crabSpecies,
  year: year,
  onYearSelected: onYearSelected,
);

Widget question4 = QuestionAnswer4Page(
  image: crabImage,
  name: crabSpecies,
  month: month,
  onMonthSelected: onMonthSelected,
);

Widget question7 = QuestionAnswer7Page(
  image: crabImage,
  name: crabSpecies,
  intensity: intensity,
  onIntensitySelected: onIntensitySelected,
);

Widget question9 = QuestionAnswer9Page(
  image: crabImage,
  name: crabSpecies,
  berried: berried,
  onBerriedSelected: onBerriedSelected,
);

Widget question11 = QuestionAnswer11Page(
  image: crabImage,
  name: crabSpecies,
  state: state,
  onStateSelected: onStateSelected,
);

Widget question12 = QuestionAnswer12Page(
  image: crabImage,
  name: crabSpecies,
  state: state,
  onCountySelected: onCountySelected,
  county: county,
);


Widget question16 = const QuestionAnswer16Page(
);


// Add question widgets to the list
List<Widget> questionsPagesList = [
  question3,
  question4,
  question7,
  question11,
  question12,
  question16
  //const QuestionAnswer13Page(),
];