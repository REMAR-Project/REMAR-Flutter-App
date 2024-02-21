import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remar_web/pages/quiz_main.dart';
import 'package:remar_web/widgets/app_bar.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const MyAppBar(),
          const SizedBox(
            height: 50,
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
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const QuizMain(totalQues: 10),
                    ),
                  );
                },
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  onEnter: (_) => setState(() => hoveredBox1 = true),
                  onExit: (_) => setState(() => hoveredBox1 = false),
                  child: AnimatedContainer(
                    height: 250,
                    decoration: BoxDecoration(
                        color: hoveredBox1 ? const Color(0xFFFFC107): const Color(0xFF4CAF50),
                        borderRadius:
                            BorderRadius.circular(hoveredBox1 ? 35 : 25),
                        boxShadow: [
                          BoxShadow(
                              color: hoveredBox1
                                  ? const Color(0xFFFFC107).withOpacity(0.5)
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
                              fontSize: 24.0,
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
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(color: Colors.black)),
                            child: const Column(
                              children: [
                                Text(
                                  'Advanced\n14 clicks',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 22.0,
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
                      builder: (context) => const QuizMain(totalQues: 10),
                    ),
                  );
                },
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  onEnter: (_) => setState(() => hoveredBox2 = true),
                  onExit: (_) => setState(() => hoveredBox2 = false),
                  child: AnimatedContainer(
                    height: 250,
                    decoration: BoxDecoration(
                        color: hoveredBox2 ? const Color(0xFFFFC107): const Color(0xFF4CAF50),
                        borderRadius:
                            BorderRadius.circular(hoveredBox2 ? 35 : 25),
                        boxShadow: [
                          BoxShadow(
                              color: hoveredBox2
                                  ? const Color(0xFFFFC107).withOpacity(0.5)
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
                              fontSize: 24.0,
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
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(color: Colors.black)),
                            child: const Column(
                              children: [
                                Text(
                                  'Basic\n10 clicks',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 22.0,
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
                height: 20,
              ),
              GestureDetector(
                onTap: () {},
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Container(
                    width: 180,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4CAF50),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Text(
                      'Read More',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.0,
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
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF4CAF50),
                ),
              ),
            ),
          )
        ],
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
