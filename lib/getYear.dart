import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remar_flutter_app/displaylist.dart';
import 'app_bar.dart';
import 'bottom_navigation_bar.dart';
import 'Strings_english.dart';

List<String> arrayList = Strings.list_months;


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: const CustomAppBar(),
        bottomNavigationBar: const CustomBottomNavigationBar(),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/raster_q0_0.png',
                  width: 100,
                  height: 75,
                ),
                const Text(
                  Strings.monitoring_Cardisoma_guanhumi,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            const SizedBox(
              width: 350,
                child: Text(Strings.choose_year_instruction,
              style: TextStyle(fontSize: 15),
              )
            ),
            const SizedBox(
              height: 575,
              child: DisplayList(arrayList: [],)

            )
  ]

      ),

    ));


  }
}

void _getList(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => DisplayList(
          arrayList: arrayList,
      ),
    ),
  );
}
