import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remar_flutter_app/widgets/app_bar.dart';
import 'package:remar_flutter_app/question_screens/question_main_screen.dart';


import '../../utils/color_res.dart';
import 'about_us_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String route = '/quiz';


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool hoveredBox1 = false;
  bool hoveredBox2 = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomAppBar(),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Choose one of the following options by tapping with fingers.',
              style: GoogleFonts.oswald(
                fontSize: 26.0,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const QuestionMain(totalQues: 14),
                      ),
                    );
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    onEnter: (_) => setState(() => hoveredBox1 = true),
                    onExit: (_) => setState(() => hoveredBox1 = false),
                    child: AnimatedContainer(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          color: hoveredBox1 ? ColorRes.yellowColor: ColorRes.greenColor,
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
                              'Full Version',
                              style: GoogleFonts.oswald(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            Expanded(
                              child: Image.asset(
                                "assets/images/raster_arrow_down.png",
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              width: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(color: Colors.black)),
                              child: const Column(
                                children: [
                                  Text(
                                    'Advanced\n14 clicks',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const QuestionMain(totalQues: 10),
                      ),
                    );
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    onEnter: (_) => setState(() => hoveredBox2 = true),
                    onExit: (_) => setState(() => hoveredBox2 = false),
                    child: AnimatedContainer(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          color: hoveredBox2 ? ColorRes.yellowColor: ColorRes.greenColor,
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
                              'Simple Version',
                              style: GoogleFonts.oswald(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            Expanded(
                              child: Image.asset(
                                "assets/images/raster_arrow_down.png",
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              width: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(color: Colors.black)),
                              child: const Column(
                                children: [
                                  Text(
                                    'Basic\n10 clicks',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height:50,
            ),
            Column(
              children: [
                const Text(
                  'For more information click on the green button below.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.black45,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => const AboutUs()));
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      width: 150,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: ColorRes.greenColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Read More',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                _showDialog("message");
              },
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Text(
                  'Privacy Policy',
                  style: GoogleFonts.oswald(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    color: ColorRes.greenColor,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _showDialog(String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return const AlertDialog(
          backgroundColor: Colors.white,
          title: Text("Privacy Policy",style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w900),),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("Edinburgh Napier University complies with the data protection law. This application does not specifically collect any personal data and we ask that you do not provide any personal data in the free text fields. However, if you inadvertently provide any personal data, we will protect this data in accordance with the General Data Protection Regulation (GDPR) and other relevant data protection laws.",style: TextStyle(color: Colors.black54,fontSize: 18,fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        );
      },
    );
  }
}
