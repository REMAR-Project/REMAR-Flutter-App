import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:remar_web/pages/about_us.dart';
import 'package:remar_web/pages/quiz_main.dart';
import 'package:remar_web/pages/splash_page.dart';
import 'package:remar_web/providers/bottom_state_provider.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

const greenColor = Color(0xFF4CAF50);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomStateProvider())
      ],
      child: MaterialApp(
        title: 'Remar Citizen',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: const Color(0xFF4CAF50),
          canvasColor: Colors.white,
          textTheme: GoogleFonts.latoTextTheme(),
          useMaterial3: true,
        ),
        initialRoute: '/home',
        routes: {
          '/home': (context) => const SplashPage(),
          '/quiz': (context) => const HomePage(),
          '/about_us': (context) => const AboutUs(),
        },
      ),
    );
  }
}
