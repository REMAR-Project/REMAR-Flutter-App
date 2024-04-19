import 'package:flutter/cupertino.dart';
import 'package:remar_flutter_app/question_screens/question2.dart';
import 'package:remar_flutter_app/question_screens/question3.dart';
import 'package:remar_flutter_app/question_screens/question4.dart';
import 'package:remar_flutter_app/question_screens/question5.dart';
import 'package:remar_flutter_app/question_screens/question7.dart';
import 'package:remar_flutter_app/question_screens/question8.dart';
//import 'package:remar_flutter_app/question_screens/question8.dart';
import 'package:remar_flutter_app/question_screens/question9.dart';
import 'package:remar_flutter_app/question_screens/question10.dart';
import 'package:remar_flutter_app/question_screens/question11.dart';
import 'package:remar_flutter_app/question_screens/question12.dart';
import 'package:remar_flutter_app/question_screens/question13.dart';
import 'package:remar_flutter_app/question_screens/question14.dart';
import 'package:remar_flutter_app/question_screens/question15.dart';
import 'package:remar_flutter_app/question_screens/question16.dart';


// list of answers
int version=0;              // 0 = advanced, 1 = short
String CrabSelected ='';
String crabSpecies = '';
String crabImage = '';

// Define initial values for various properties
String year = '';
String month = '';
DateTime observedDates = '' as DateTime;
String intensity ='';
String whenObserved='';
String berried='';
String habitat = '';
String state = '';
String county = '';
String protectedArea = '';
String occupation ='';
String additionalInfo='';



// Define callback functions for updating the properties


void onCrabSelected(String selectedCrabImage) {
  CrabSelected = selectedCrabImage;
  print(CrabSelected);
}

void onCrabSpeciesSelected(String selectedSpecies) {
  crabSpecies = selectedSpecies;
  print(crabSpecies);
}


void onYearSelected(String selectedYear) {
  year = selectedYear;
  print(year);
}

void onMonthSelected(String selectedMonth) {
  month = selectedMonth;
  print(month);
}

void onDatesSelected(String selectedDates) {
  observedDates = selectedDates as DateTime;
}

void onIntensitySelected(String selectedIntensity) {
  intensity = selectedIntensity;
  print(intensity);
}


void onWhenObserved(String selectedWhenObserved) {
  whenObserved = selectedWhenObserved;
}

void onBerriedSelected(String selectedBerried) {
  berried = selectedBerried;
  print(berried);
}

void onHabitatSelected(String selectedHabit) {
  habitat = selectedHabit;
  print(habitat);
}

void onStateSelected(String selectedState) {
  state = selectedState;
  print(selectedState);
}

void onCountySelected(String selectedCounty) {
  county = selectedCounty;
  print(county);
}

void onProtectedAreaSelected(String selectedProtectedArea) {
  protectedArea = selectedProtectedArea;
  print(protectedArea);
}


void onOccupationSelected(String selectOccupation) {
   occupation = selectOccupation;
   print(occupation);
}

void onAdditionalInfoSelected(String selectedAdditionalInfo) {
  additionalInfo = selectedAdditionalInfo;
}

Widget question2 =  const QuestionAnswer2Page(
  onCrabSelected:  onCrabSelected,
);


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


Widget question8 = QuestionAnswer8Page(
  image: crabImage,
  name: crabSpecies,
  onWhenObserved: onWhenObserved,

);

Widget question9 = QuestionAnswer9Page(
  image: crabImage,
  name: crabSpecies,
  berried: berried,
  onBerriedSelected: onBerriedSelected,
);


Widget question10 = QuestionAnswer10Page(
  image: crabImage,
  name: crabSpecies,
  onHabitatSelected: onHabitatSelected, habitat: '',
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

Widget question13 = QuestionAnswer13Page(
  image: crabImage,
  name: crabSpecies,
  state: state,
  onProtectedAreaSelected: onProtectedAreaSelected,
  protectedArea: protectedArea,
);


Widget question14 = QuestionAnswer14Page(
  image: crabImage,
  name: crabSpecies,
  onOccupationSelected: onOccupationSelected,
  occupation: occupation,
);

Widget question15 = QuestionAnswer15Page(
  image: crabImage,
  name: crabSpecies,
  onAdditionalInfoSelected: onAdditionalInfoSelected,
  additionalInfo: additionalInfo,
);


Widget question16 = const QuestionAnswer16Page(
);



List<Widget> questionsPagesLongList() {
  return [
    question2,
    question3,
    question4,
    question7,
    question8,
    question9,
    question10,
    question11,
    question12,
    question13,
    question14,
    question15,
    question16
  ];
}

List<Widget> questionsPagesShortList() {
  return [
    question3,
    question4
  ];
}


