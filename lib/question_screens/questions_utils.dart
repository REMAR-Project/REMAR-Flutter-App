import 'package:flutter/cupertino.dart';
import 'package:remar_flutter_app/question_screens/question3.dart';
import 'package:remar_flutter_app/question_screens/question4.dart';
import 'package:remar_flutter_app/question_screens/question5.dart';
import 'package:remar_flutter_app/question_screens/question6.dart';
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
import 'global.dart';

import 'package:flutter/cupertino.dart';
import 'package:remar_flutter_app/question_screens/question11.dart';
import 'package:remar_flutter_app/question_screens/question12.dart';
import 'package:remar_flutter_app/question_screens/question13.dart';
import 'package:remar_flutter_app/question_screens/question3.dart';
import 'package:remar_flutter_app/question_screens/question4.dart';
import 'package:remar_flutter_app/question_screens/question7.dart';
import 'package:remar_flutter_app/question_screens/question9.dart';



// list of answers


const String crabSpecies = 'Cardisoma guanhumi';
const String crabImage = 'assets/images/raster_q1_0.png';
const String crabSpecies = 'Ucides cordatus';
const String crabImage = 'assets/images/raster_q0_0.png';


// Define initial values for various properties
String year = '';
String month = '';
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
void onYearSelected(String selectedYear) {
  year = selectedYear;
  print(year);

}

void onMonthSelected(String selectedMonth) {
  month = selectedMonth;

  print(month);

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



Widget question8 = const QuestionAnswer8Page(
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



Widget question10 = const QuestionAnswer10Page(
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



// Add question widgets to the list
List<Widget> questionsPagesList = [
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
  //const QuestionAnswer13Page(),
];



