import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remar_web/main.dart';
import 'package:remar_web/widgets/app_bar.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  static const String route = '/about_us';

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  List<Map<String, dynamic>> listOfMaps = [];
  int? hoveredIndex;
  @override
  void initState() {
    loadJSONFromAsset();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const MyAppBar(),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: listOfMaps.length,
                itemBuilder: (context, index) {
                  final item = listOfMaps[index];
                  return Container(
                    margin: EdgeInsets.only(left: 50, right: 50,bottom: index == listOfMaps.length - 1 ? 20 : 0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Theme(
                        data:  ThemeData(hoverColor: Colors.transparent,splashColor: Colors.transparent,highlightColor: Colors.transparent),
                        child: ExpansionTile(
                            maintainState: true,
                            expandedAlignment: Alignment.centerLeft,
                            backgroundColor: Colors.grey.shade100,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            collapsedShape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            collapsedBackgroundColor: Colors.grey.shade200,
                            collapsedTextColor: Colors.black,
                            iconColor: Colors.black,
                            collapsedIconColor: greenColor,
                            childrenPadding:
                                const EdgeInsets.only(left: 10, right: 10),
                            title: Html(
                              data: item['title'],
                              style: {
                                'body': Style.fromTextStyle(GoogleFonts.oswald(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ))
                              },
                            ),
                            children: [
                              Html(
                                data: item['content'],
                                style: {
                                  'body': Style.fromTextStyle(GoogleFonts.oswald(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                  ))
                                },
                              )
                            ]),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Future<void> loadJSONFromAsset() async {
    String jsonString =
        await rootBundle.loadString('assets/jsons/about_us.json');
    listOfMaps = json.decode(jsonString).cast<Map<String, dynamic>>();
  }
}
