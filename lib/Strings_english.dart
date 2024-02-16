import 'dart:core';


class Strings {

  // banner text
  static const tool_bar_name = "REMAR_";
  static const tool_bar_sub_name="CITIZEN";

  // navigation

  static const back="Press to go back";
  static const start="press to proceed";
  static const proceed="Proceed";

  // crab species

  static const Ucides_cordatus="Ucides cordatus";
  static const Cardisoma_guanhumi="Cardisoma guanhumi";
  static const monitoring_Ucides_cordatus="Monitoring Ucides cordatus";
  static const monitoring_Cardisoma_guanhumi="Monitoring Cardisoma guanhum";

  // screen 0 (initial screen) for both advanced and basic. For both crab species.

  static const version_instruction="Choose one of the below by tapping with finger";
  static const full_vesion="Full Version";
  static const simple_version="Simple Version";
  static const advanced_clicks="Advanced 14 clicks";
  static const basic_clicks="Basic 10 clicks";
  static const more_info ="For more information, click on the green button below";
  static const read_more ="READ MORE";
  static const privacy="Privacy Policy";

  // screen 1 (select crab species) For both full and simple versions. For both versions of crabs

  static const become_citizen_scientist="Become a citizen scientist";
  static const become_citizen_scientist_sub="and help record mass mating events of commercially important Brazilian mangrove crabs";
  static const this_info="This information will help to improve Brazilian crab fisheries legislation and fishers livelihoods";
  static const click="click on one of the below species to share your observations";

  // screen 2 (select year) For both full and simple version. For both versions of crabs

  static const choose_year_instruction="When did you observe andada? Touch screen, move finger and tap to choose current year you observed the andada";

  static var years = const [
    "2016",
    "2017",
    "2018",
    "2019",
    "2020",
    "2021",
    "2022",
    "2023",
    "2024",
    "2025"
  ];

  // screen 3.(select month) For both full and simple versions. For both versions of crabs

  static const choose_month_instruction="Touch screen and move finger to choose correct month.  In case you saw two andadas this month (one around new moon and one around full moon), please run the app for each andada separately";

  static var months = const [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  // screen 4 (select day). For both full and simple versions. For both versions of crabs

  static const day_instruction="For the andada you are reporting here, touch with finger when you noted it. Remember: in case you saw andada in two periods (e.g. one around new moon and one around full moon), only mark ONE period (SEVERAL CONSECUTIVE DAYS OR ONE DAY).";
  static const new_moon="New moon";
  static const full_moon="Full moon";

  // screen 5. (select strongest andada activity) For advanced only

  static const strongest_activity_instruction="Touch the day with the STRONGEST andada activity. If you don't know, you can proceed without selecting a date";

  // Screen 6 (intensity) for advanced. Screen 5 for basic

  static const intensity="How do you estimate the intensity of the observed andada:";

  static var intensity_level = const [
    "Very Low",
    "Low",
    "Medium",
    "High",
    "Very High",
    "I Don't Know"
  ];

  // screen 7 (time observed) for advanced only

  static const time_observed_instuctions="When did you observe andada? Touch correct symbol with finger";
  static const day_only="Only at day";
  static const night_only="Only at night";
  static const all_day="At day and night";
  static const not_looked="I did not look";

  // screen 8 (ovigerous) for advanced only

  static const ovigerous_instruction="Did you see berried (ovigerous) females? Touch correct answer with finger";

  static var ovigerous_list = const [
    "Yes, I saw berried females",
    "No, there were no berried females",
    "I did not look"
  ];

  // Screen 9 (Habitat). Advanced only

  static const habitat_instructions="In which habitat did you observe the andada? Touch correct answer with finger. You can chose more than one option";

  static var ucides_cordatus_habitat_list = const [
    "Mangrove",
    "Forest",
    "Beach",
    "Road",
    "Other"
  ];

  static var cardisoma_guanhumi_habitat = const [
    "Mangrove",
    "Saltmarsh",
    "Forest",
    "Road",
    "River Bed",
    "Rocky Shore",
    "House",
    "Other"
  ];

  // screen 10 (state) for advanced. Screen 6 for basic

  static const state_instruction="Touch screen, move with finger and tap to select the state where you made your observation";

 static var state_list = const [
    "Alagoas",
    "Amapá",
    "Bahia",
    "Ceará",
    "Espírito Santo",
    "Maranhão",
    "Paraná",
    "Paraíba",
    "Pará",
    "Pernambuco",
    "Piauí",
    "Rio Grande do Norte",
    "Rio de Janeiro",
    "Santa Catarina",
    "Sergipe",
    "São Paulo"
  ];



  // screen 11 (state county in which observed) for advanced only.  Screen 7 for basic only.

  static const states="Touch screen, move with finger and tap to select the county you made your observation";

  // screen 12 (protected area) for advanced only. Screen 8 for basic.

  static const is_protected="Is the monitored locality in a protected area?";
  static const protected_instruction="Touch screen and move/tap finger to select the correct Protected Area";

  // screen 13 (what do you do) for advanced. Screen 9 for basic
  static const user_role_instruction="Please can you let us know what you do? Touch screen and move finger to select";

  static var user_role_list = const [
    "I catch crabs and depend on them for my living",
    "I catch crabs only occasionally for my own consumption",
    "I work with crab meat processing",
    "I work with crab commercialization",
    "I am a local villager and do not normally catch mangrove crabs",
    "I work for ICMBio and observe the andada myself",
    "I work for ICMBio and report results of a crab fisher",
    "I work for IBAMA and observed the andada myself",
    "I work for IBAMA and report results of a crab fisher",
    "I work in the city hall and observed and observed the andada myself",
    "I work in the city hall and report results of a crab fisher",
    "I am a researcher and observed the andada myself",
    "I am a researcher and report results of a crab fisher"

  ];

  // screen 14 for advanced, 10 for basic screen

  static const additional_observation_instructions="Any additional observations you want to share?";
  static const enter_additional_information="Please touch field and type";

}