import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remar_flutter_app/utils/color_res.dart';
import 'package:provider/provider.dart';

import '../Screens/providers/bottom_state_provider.dart';
import '../global.dart';

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
      builder: ((context, value, child) => Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
            height: 60, // Fixed height to avoid resizing issues
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: ColorRes.greenColor, width: 5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Back button and text
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      pageController.previousPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOutCubic);
                      backwardsNavigation = true;
                    },
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.arrow_back_ios_rounded,
                            color: currentPageIndex == 0
                                ? Colors.grey
                                : ColorRes.greenColor,
                            size: 24, // Reduced size to avoid overflow
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: FittedBox(
                              child: Text(
                                "Press to go back",
                                style: GoogleFonts.oswald(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Page indicator
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "${currentPageIndex + 1}/$totalQuestions",
                    style: GoogleFonts.oswald(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // Forward button and text
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      if(enableForwardNavigation == true) {
                        pageController.nextPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeInOutCubic);
                      }
                    },
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                            child: FittedBox(
                              child: Text(
                                "Press to proceed",
                                style: GoogleFonts.oswald(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: currentPageIndex == totalQuestions - 1
                                ? Colors.grey
                                : ColorRes.greenColor,
                            size: 24, // Reduced size to avoid overflow
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
