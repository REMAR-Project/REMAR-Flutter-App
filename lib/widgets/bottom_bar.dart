import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:remar_web/main.dart';
import 'package:remar_web/providers/bottom_state_provider.dart';

class MyBottomBar extends StatelessWidget {
  final PageController pageController;
  final int currentPage;
  final int totalQues;

  const MyBottomBar(
      {super.key,
      required this.pageController,
      required this.currentPage,
      required this.totalQues});

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomStateProvider>(
      builder: ((context,value,child) =>  Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: const BoxDecoration(
                border:
                Border(top: BorderSide(color: Color(0xFF4CAF50), width: 10))),
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
                              color: currentPage == 0 ? Colors.grey : greenColor,
                              borderRadius: BorderRadius.circular(100)),
                          child: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: currentPage == 0 ? Colors.black : Colors.white,
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
                    text: "${currentPage + 1}/$totalQues",
                    style: GoogleFonts.oswald(
                      color: Colors.black,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if(value.isOptionSelected){
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOutCubic);
                    }

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
                              color: currentPage == totalQues || !value.isOptionSelected
                                  ? Colors.grey
                                  : greenColor,
                              borderRadius: BorderRadius.circular(100)),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: currentPage == totalQues || !value.isOptionSelected
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
