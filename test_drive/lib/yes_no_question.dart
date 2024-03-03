import 'package:flutter/material.dart';
import 'app_bar.dart';
import 'bottom_navigation_bar.dart';
import 'options_list_view.dart';
import 'question_page.dart'; // Import QuestionPage widget

class YesNoQuestion extends StatelessWidget {
  final String question;
  final String imagePath; // New parameter for the image path
  final String crabName; // New parameter for the crab name
  final Function(bool) onAnswered;
  final int pageNumber; // Page number
  final int totalPages; // Total number of pages
  final int currentPageIndex; // Current page index

  const YesNoQuestion({
    Key? key,
    required this.question,
    required this.imagePath,
    required this.crabName,
    required this.onAnswered,
    required this.pageNumber,
    required this.totalPages, // Added totalPages parameter
    required this.currentPageIndex, // Added currentPageIndex parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  imagePath,
                  height: 150,
                ),
                SizedBox(width: 50),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Monitoring $crabName',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                question,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      onAnswered(false);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OptionsListView( 
                            onSelectOption: (String option) {},
                            selectedOption: '',
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'No',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      side: BorderSide(color: Colors.black),
                      fixedSize: Size(500, 10),
                    ),
                  ),
                  SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: () {
                      onAnswered(true);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuestionPage(
                            imagePath: imagePath,
                            crabName: crabName,
                            //pageNumber: pageNumber,
                            //totalPages: totalPages,
                            //currentPageIndex: currentPageIndex, // Pass currentPageIndex to QuestionPage
                          ), 
                        ),
                      );
                    },
                    child: Text(
                      'Yes',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      side: BorderSide(color: Colors.black),
                      fixedSize: Size(500, 10),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        //totalPages: totalPages,
        //currentPageIndex: currentPageIndex,
      ),
    );
  }
}
