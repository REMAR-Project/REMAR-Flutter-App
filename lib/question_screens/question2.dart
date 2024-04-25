import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:core';
import '../global.dart';
import '../utils/color_res.dart';

class QuestionAnswer2Page extends StatefulWidget {

  const QuestionAnswer2Page({
    super.key,
  });

  @override
  State<QuestionAnswer2Page> createState() => _QuestionAnswer2PageState();
}

class _QuestionAnswer2PageState extends State<QuestionAnswer2Page> {
  bool hoveredBox1 = false;
  bool hoveredBox2 = false;

  String imagePath1 =
      "assets/images/raster_q0_0.png"; // Path to default image 1
  String imagePath2 =
      "assets/images/raster_q0_1.png"; // Path to default image 2
  bool isSelected1 = false;
  bool isSelected2 = false;

  void selectContainer1() {
    setState(() {
      isSelected1 = true;
      isSelected2 = false;
      // Change the image path for container 1
      imagePath1 = "assets/images/raster_q1_0.png"; // Path to selected image 1
      imagePath2 = "assets/images/raster_q0_1.png"; // Path to default image 2
    });
  }

  void selectContainer2() {
    setState(() {
      isSelected1 = false;
      isSelected2 = true;
      // Change the image path for container 2
      imagePath2 = "assets/images/raster_q1_1.png"; // Path to selected image 2
      imagePath1 = "assets/images/raster_q0_0.png"; // Path to default image 1
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              "Become a citizen scientist and help record mass mating events of commercially important Brazilian mangrove crabs.\nThis information will help to improve Brazilian crab fisheries legislation and fishers' livelihoods.\nClick on one of the below species to share your observations..",
              textAlign: TextAlign.center,
              style: GoogleFonts.oswald(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: GestureDetector(
                    onTap: () {
                      selectContainer1();
                      selectedCrabSpecies ='Ucides cordatus';
                      selectedCrabSpeciesImage = "assets/images/raster_q0_0.png";
                      enableForwardNavigation = true;
                    },
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onEnter: (_) => setState(() => hoveredBox1 = true),
                      onExit: (_) => setState(() => hoveredBox1 = false),
                      child: AnimatedContainer(
                        height: 250,
                        width: 250,
                        decoration: BoxDecoration(
                            color: hoveredBox1 || isSelected1
                                ? ColorRes.yellowColor
                                : ColorRes.greenColor,
                            borderRadius:
                            BorderRadius.circular(hoveredBox1 ? 35 : 25),
                            boxShadow: [
                              BoxShadow(
                                  color: hoveredBox1
                                      ? ColorRes.yellowColor.withOpacity(0.5)
                                      : Colors.black26,
                                  blurRadius: 10,
                                  spreadRadius: 5)
                            ]),
                        duration: const Duration(milliseconds: 300),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Ucides cordatun',
                                style: GoogleFonts.oswald(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  width: 150,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(color: Colors.black)),
                                  child: Image.asset(imagePath1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Flexible(
                  child: GestureDetector(
                    onTap: () {
                      selectContainer2();
                      selectedCrabSpecies ='Cardisoma guanhumi';
                      selectedCrabSpeciesImage = "assets/images/raster_q0_1.png";
                      enableForwardNavigation = true;
                    },
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onEnter: (_) => setState(() => hoveredBox2 = true),
                      onExit: (_) => setState(() => hoveredBox2 = false),
                      child: AnimatedContainer(
                        height: 250,
                        width: 250,
                        decoration: BoxDecoration(
                            color: hoveredBox2 || isSelected2
                                ? ColorRes.yellowColor
                                : ColorRes.greenColor,
                            borderRadius:
                            BorderRadius.circular(hoveredBox2 ? 35 : 25),
                            boxShadow: [
                              BoxShadow(
                                  color: hoveredBox2
                                      ? ColorRes.yellowColor.withOpacity(0.5)
                                      : Colors.black26,
                                  blurRadius: 10,
                                  spreadRadius: 5)
                            ]),
                        duration: const Duration(milliseconds: 300),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Cardisoma guanhumi',
                                style: GoogleFonts.oswald(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  width: 150,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(color: Colors.black)),
                                  child: Image.asset(imagePath2),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}