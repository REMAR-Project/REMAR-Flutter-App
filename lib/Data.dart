import 'package:remar_flutter_app/global.dart';
import 'dart:convert';

class AdvancedData {

  Map<String, dynamic> long_version_data = {
    'Crab Species': selectedCrabSpecies,
    'Year': year,
    'Month': month,
   'Observation Date Range': Q5selectedDates.map((date)=> date.toIso8601String()).toList(),
   'Observation Strongest Date': Q6selectedDate.map((date)=> date.toIso8601String()).toList(),
    'Intensity': intensity,
    'Time Observed': timeObserved,
    'Ovigerous': berried,
    'Habitat': habitat,
    'State': state,
    'County': county,
    'Is Protected Area': protectedAreaResponse,
    'Protected Area': protectedArea,
    'Occupation': occupation,
    'Additional Observations': additionalObservations
  };

  String getJsonString() {
    return jsonEncode(long_version_data);

  }

}

class ShortData {

  Map<String, dynamic> short_version_data = {
    'Crab Species': selectedCrabSpecies,
    'Year': year,
    'Month': month,
    'Observation Date Range': Q5selectedDates.map((date)=> date.toIso8601String()).toList(),
    'Intensity': intensity,
    'State': state,
    'County': county,
    'Is Protected Area': protectedAreaResponse,
    'Protected Area': protectedArea,
    'Occupation': occupation,
    'Additional Observations': additionalObservations
  };

  String getJsonString() {
    return jsonEncode(short_version_data);

  }
}
