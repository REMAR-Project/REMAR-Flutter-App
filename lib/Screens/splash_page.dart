import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/color_res.dart';
import 'home_page.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()))

    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Container(
            color: ColorRes.greenColor,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "REMAR",
                        style: GoogleFonts.oswald(
                          color: Colors.black,
                          fontSize: 36.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      TextSpan(
                        text: "_CITIZEN",
                        style: GoogleFonts.oswald(
                          color: Colors.black,
                          fontSize: 28.0,
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    const Text(
                      "Monitoring Mass Mating Events of Mangrove Crabs",
                      style: TextStyle(fontSize: 32, color: Colors.black),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Image.asset(
                      "assets/images/raster_page1_crabs.png",
                      height: 150,
                    ),
                    const SizedBox(
                      height: 100,
                    )
                  ],
                )
              ],
            ),
          )),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Image.asset("assets/images/raster_page1_logos_1.png",
                    height: 50),
                Image.asset("assets/images/raster_page1_logos_2.png",
                    height: 50),
              ],
            ),
          )
        ],
      ),
    );
  }
}
