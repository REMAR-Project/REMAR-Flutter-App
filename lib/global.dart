// Navigation control
import 'dart:core';


bool enableForwardNavigation = false;


// responses from question pages
int version = 0; // 0 = advanced, 1 = short

// Select version (0) = long (1) short

// Selected crab species from question 2
String selectedCrabSpecies='';
String selectedCrabSpeciesImage='';

// Select year from question 3
 String year='';

// Select month from question 4
String month='';

// question 5
List<DateTime> selectedDates = [];

// question 6
List<DateTime> selectedDate = []; 

//Select intensity from question 7
String intensity='';

// question 8

// Select observed berried females from quesiton 9
String berried='';

// Select habitat from question 10
String habitat='';

// Select state where observation made from question 11
String state='';

// Select county where observation made from question 12
String country='';

// Select protected area from question 13
String protectedArea='';
bool isProtectedArea = false;

// select occupation from question 14
String occupation='';

// Collect additional observations frm question 15
String additionalObservations='';
