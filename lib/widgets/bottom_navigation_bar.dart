import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remar_flutter_app/utils/color_res.dart';
import 'package:provider/provider.dart';

import '../Screens/providers/bottom_state_provider.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentPageIndex;
  final int totalQuestions;
  final PageController pageController;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentPageIndex,
    required this.pageController,
    required this.totalQuestions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomStateProvider>(
      builder: ((context, value, child) => Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: const BoxDecoration(
                    border: Border(
                        top:
                            BorderSide(color: ColorRes.greenColor, width: 10))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        pageController.previousPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeInOutCubic);
                      },
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: currentPageIndex == 0
                                      ? Colors.grey
                                      : ColorRes.greenColor,
                                  borderRadius: BorderRadius.circular(100)),
                              child: Icon(
                                Icons.arrow_back_ios_rounded,
                                color: currentPageIndex == 0
                                    ? Colors.black
                                    : Colors.white,
                                size: 30,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RichText(
                              text: TextSpan(
                                text: "Press to go back",
                                style: GoogleFonts.oswald(
                                  color: Colors.black,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: "${currentPageIndex + 1}/$totalQuestions",
                        style: GoogleFonts.oswald(
                          color: Colors.black,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        pageController.nextPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeInOutCubic);
                      },
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: "Press to proceed",
                                style: GoogleFonts.oswald(
                                  color: Colors.black,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: currentPageIndex == totalQuestions
                                      ? Colors.grey
                                      : ColorRes.greenColor,
                                  borderRadius: BorderRadius.circular(100)),
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: currentPageIndex == totalQuestions
                                    ? Colors.black
                                    : Colors.white,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
