import 'package:flutter/material.dart';
import 'package:remar_flutter_app/question_screens/questions_utils.dart';

import '../widgets/app_bar.dart';
import '../widgets/bottom_navigation_bar.dart';
import 'package:remar_flutter_app/global.dart' as global;

class QuestionMain extends StatefulWidget {
  final int totalQues;

  const QuestionMain({super.key, required this.totalQues});

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
              children: global.version== 0
                  ? questionsPagesLongList()
                  : questionsPagesShortList(),
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
