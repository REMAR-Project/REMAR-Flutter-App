import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remar_flutter_app/utils/color_res.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(right: 10, left: 10),
          height: 60,
          width: double.infinity,
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: ColorRes.greenColor, width: 10))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              Row(
                children: [
                  Image.asset('assets/images/raster_logo_ufsb.png'),
                  Image.asset(
                    "assets/images/raster_logo_napier.png",
                  ),
                ],
              )
            ],
          ),
        ),

      ],
    );
  }
}
