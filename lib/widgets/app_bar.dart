import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remar_flutter_app/utils/color_res.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              padding: const EdgeInsets.only(right: 15, left: 15),
              width: double.infinity,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: ColorRes.greenColor, width: 5),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "REMAR",
                              style: GoogleFonts.oswald(
                                color: Colors.black,
                                fontSize: 25.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            TextSpan(
                              text: "_CITIZEN",
                              style: GoogleFonts.oswald(
                                color: Colors.black,
                                fontSize: 18.0,
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
                        height: MediaQuery.of(context).size.height * 00.4,
                        width: MediaQuery.of(context).size.width * 00.2,
                      ),
                      Image.asset(
                        "assets/images/raster_logo_napier.png",
                        height: MediaQuery.of(context).size.height * 00.4,
                        width: MediaQuery.of(context).size.width * 00.2,
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}


