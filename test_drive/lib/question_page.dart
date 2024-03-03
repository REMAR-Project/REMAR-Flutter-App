import 'package:flutter/material.dart';
import 'app_bar.dart';
import 'bottom_navigation_bar.dart';

class QuestionPage extends StatelessWidget {
  final String imagePath; // New parameter for the image path
  final String crabName; // New parameter for the crab name

  const QuestionPage({
    Key? key,
    required this.imagePath,
    required this.crabName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0), // Add padding here
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  imagePath,
                  height: 150,
                ),
                const SizedBox(width: 20), // Add space between the image and text
                Text(
                  'Monitoring $crabName',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Any additional observation you want to share?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            const Text(
              'Tap the space to write and then click next.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Type your answer here...',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 5),
              ),
              maxLines: null, // Allow multiple lines for the answer
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
