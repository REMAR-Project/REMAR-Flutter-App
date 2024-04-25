import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remar_flutter_app/utils/color_res.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double imageHeight = constraints.maxHeight > 40 ? 40 : constraints.maxHeight;
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.only(right: 10, left: 10),
              width: double.infinity,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: ColorRes.greenColor, width: 5))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "REMAR",
                              style: GoogleFonts.oswald(
                                color: Colors.black,
                                fontSize: 30.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            TextSpan(
                              text: "_CITIZEN",
                              style: GoogleFonts.oswald(
                                color: Colors.black,
                                fontSize: 24.0,
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/raster_logo_ufsb.png',
                        height: imageHeight,
                        fit: BoxFit.contain,
                      ),
                      Image.asset(
                        "assets/images/raster_logo_napier.png",
                        height: imageHeight,
                        fit: BoxFit.contain,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}