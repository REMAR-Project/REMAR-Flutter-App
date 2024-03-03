import 'package:flutter/material.dart';
import 'app_bar.dart';

// This class represents the list view of options.
class OptionsListView extends StatelessWidget {
  final Function(String) onSelectOption; // Callback function to handle option selection
  final String selectedOption; // Currently selected option

  // Constructor to initialize the options list view
  const OptionsListView({
    Key? key,
    required this.onSelectOption,
    required this.selectedOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar(),
      body: Center(
      child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
      child: ListView( // ListView to display options
        shrinkWrap: true, // Allow the ListView to take only the space it needs
        children: <Widget>[
          ListTile( // Option 1: "I WANT TO SUBMIT MY ANSWERS"
            title: const Text(
              'I WANT TO SUBMIT MY ANSWERS',
               // Green background color
              textAlign: TextAlign.center, // Center-align text
            ),
            tileColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: 
              Color.fromARGB(255, 253, 253, 253),
              ),
            ),
           onTap: () { // Handle tap on this option
           onSelectOption('Option 1'); // Callback to notify option selection
          },
          selected: selectedOption == 'Option 1', // Highlight this option if selected
        ),
        const SizedBox(height: 15),
        ListTile( // Option 2: "I WANT TO GO BACK TO CHANGE MY ANSWERS"
          title: const Text(
            'I WANT TO GO BACK TO CHANGE MY ANSWERS',
             // Green background color
            textAlign: TextAlign.center, // Center-align text
          ),
          tileColor: Colors.green,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: 
              Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          onTap: () { // Handle tap on this option
            onSelectOption('Option 2'); // Callback to notify option selection
          },
          selected: selectedOption == 'Option 2', // Highlight this option if selected
        ),
        const SizedBox(height: 15),
        ListTile( // Option 3: "I AM ONLY TESTING/SHOWING THE APP WITHOUT SENDING REAL DATA"
          title: const Text(
            'I AM ONLY TESTING/SHOWING THE APP WITHOUT SENDING REAL DATA',
            // Green background color
            textAlign: TextAlign.center, // Center-align text
          ),
          tileColor: Colors.green,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: 
              Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          onTap: () { // Handle tap on this option
            onSelectOption('Option 3'); // Callback to notify option selection
          },
          selected: selectedOption == 'Option 3', // Highlight this option if selected
        ),
        const Padding( // Additional information text
          padding: EdgeInsets.all(8.0),
          child: Text(
            'If you want to contact REMAR, find out about ways to engage more with this research, ask or suggest something, please send a message to remar.quest@gmail.com',
            textAlign: TextAlign.center, // Center-align text
          ),
        ),
      ],
      ),
      ),
    ),
    );
  }
}
