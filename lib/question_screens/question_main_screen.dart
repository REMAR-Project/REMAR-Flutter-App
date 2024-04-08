import 'package:flutter/material.dart';
import 'package:remar_flutter_app/question_screens/questions_utils.dart';

import '../widgets/app_bar.dart';
import '../widgets/bottom_navigation_bar.dart';

class QuestionMain extends StatefulWidget {
  final int totalQues;

  const QuestionMain({Key? key, required this.totalQues}) : super(key: key);

  @override
  State<QuestionMain> createState() => _QuestionMainState();
}

class _QuestionMainState extends State<QuestionMain> {
  int _currentPageIndex = 0;
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomAppBar(),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              children: questionsPagesList,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomBottomNavigationBar(
              pageController: controller,
              currentPageIndex: _currentPageIndex,
              totalQuestions: widget.totalQues)
        ],
      ),
    );
  }
}
