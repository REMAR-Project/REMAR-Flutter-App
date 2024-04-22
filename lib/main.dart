import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:remar_flutter_app/Screens/splash_page.dart';
import 'package:remar_flutter_app/utils/color_res.dart';
import 'Screens/providers/bottom_state_provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomStateProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: ColorRes.greenColor,
          canvasColor: Colors.white,
          textTheme: GoogleFonts.latoTextTheme(),
          useMaterial3: true,
        ),
        home: const SplashPage(),
      ),
    );
  }
}
