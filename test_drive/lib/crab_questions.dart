import 'package:flutter/material.dart';
import 'yes_no_question.dart';

class CrabQuestionsPage extends StatefulWidget {
  @override
  _CrabQuestionsPageState createState() => _CrabQuestionsPageState();
}

class _CrabQuestionsPageState extends State<CrabQuestionsPage> {
  String selectedCrabType = '';
  String crabName = ''; // Variable to store the name of the selected
  int pageNumber = 12;
  int totalPages = 14; // Total number of pages
  int currentPageIndex = 0; // Initialize currentPageIndex to 0

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose a Crab'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 150, // Set a fixed height for the button
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedCrabType = 'assets/raster_q0_0.png';
                    crabName = 'Ucides cordatus'; // Set the name of the selected crab
                  });
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    Text('Ucides cordatus'),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 100, // Set a fixed height for the image
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          'assets/raster_q0_0.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 20),
            SizedBox(
              height: 150, // Set a fixed height for the button
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedCrabType = 'assets/raster_q0_1.png';
                    crabName = 'Cardisoma guanhumi'; // Set the name of the selected crab
                  });
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    Text('Cardisoma guanhumi'),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 100, // Set a fixed height for the image
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          'assets/raster_q0_1.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 20),
            if (selectedCrabType.isNotEmpty)
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => YesNoQuestion(
                        question: 'Any additional observations you want to share?',
                        imagePath: selectedCrabType,
                        onAnswered: (bool answer) {
                          // Handle the user's answer
                        },
                        crabName: crabName, // Pass the selected crab's name
                        pageNumber: pageNumber,
                        totalPages: totalPages,
                        currentPageIndex: currentPageIndex, // Pass currentPageIndex
                      ),
                    ),
                  );
                },
                child: Text('Proceed'),
              ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        pageNumber: pageNumber,
        totalPages: totalPages,
        currentPageIndex: currentPageIndex, // Pass currentPageIndex
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int pageNumber; // Page number
  final int totalPages; // Total number of pages
  final int currentPageIndex; // Current page index

  const CustomBottomNavigationBar({
    Key? key,
    required this.pageNumber,
    required this.totalPages,
    required this.currentPageIndex, // Receive currentPageIndex
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Left navigation
              Navigator.pop(context);
            },
          ),
          Text('Page $currentPageIndex of $totalPages'), // Display the page number
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () {
              // Right navigation
              // Navigate to the next page if available
              if (currentPageIndex < totalPages) {
                // Increment the page number
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CrabQuestionsPage();
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
