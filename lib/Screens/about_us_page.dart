import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remar_flutter_app/utils/color_res.dart';
import 'package:remar_flutter_app/widgets/app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  List<Map<String, dynamic>> listOfMaps = [];
  int? hoveredIndex;

  @override
  void initState() {
    super.initState();
    loadJSONFromAsset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomAppBar(),
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
                    margin: EdgeInsets.only(
                        left: 50,
                        right: 50,
                        bottom: index == listOfMaps.length - 1 ? 20 : 0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Theme(
                        data: ThemeData(
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent),
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
                            collapsedIconColor: ColorRes.greenColor,
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
                                  'body':
                                      Style.fromTextStyle(GoogleFonts.oswald(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  )),
                                  'a': Style.fromTextStyle(GoogleFonts.oswald(
                                    fontSize: 14.0,
                                    color: ColorRes.greenColor,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.none,
                                  ))
                                },
                                onLinkTap: (
                                  url,
                                  _,
                                  __,
                                ) {
                                  _launchInBrowser(url!);
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
        await rootBundle.loadString('assets/raw_eng/about_us.json');
    setState(() {
      listOfMaps = json.decode(jsonString).cast<Map<String, dynamic>>();
    });
  }

  Future<void> _launchInBrowser(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
