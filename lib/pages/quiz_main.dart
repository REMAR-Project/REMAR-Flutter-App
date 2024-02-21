import 'package:flutter/material.dart';
import 'package:remar_web/pages/components/quiz_page.dart';

import '../widgets/app_bar.dart';
import '../widgets/bottom_bar.dart';

class QuizMain extends StatefulWidget {
  final int totalQues;

  const QuizMain({super.key, required this.totalQues});

  static const String route = '/quiz';

  @override
  State<QuizMain> createState() => _QuizMainState();
}

class _QuizMainState extends State<QuizMain> {
  PageController controller = PageController();
  int _curr = 0;
  final List<Widget> _list = <Widget>[const QuizQuesPage(quizNum: 1),const QuizQuesPage(quizNum: 2)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const MyAppBar(),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  _curr = index;
                });
              },
              children: const [QuizQuesPage(quizNum: 1),QuizQuesPage(quizNum: 2)],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MyBottomBar(
            pageController: controller,
            currentPage: _curr,
            totalQues: widget.totalQues,
          ),
        ],
      ),
    );
  }
}
