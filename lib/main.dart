import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'screens/screens.dart' as Screens;

void main() {
  runApp(Bootstrap());
}

class Bootstrap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<String>(
          create: (_) => "",
        ),
      ],
      child: App(),
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // init firebase analytics so we get automatic reporting from firebase.
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: FirebaseAnalytics())
      ],
      initialRoute: '/home',
      routes: {
        '/home': (ctx) => Screens.Home(),
        '/topics': (ctx) => Screens.Topics(),
        '/profile': (ctx) => Screens.Profile(),
        '/about': (ctx) => Screens.About(),
      },
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        colorScheme: ColorScheme.dark(),
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.lato().fontFamily,
        appBarTheme: AppBarTheme(color: Colors.indigo),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.indigo,
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: 18),
          bodyText2: TextStyle(fontSize: 16),
          button: TextStyle(letterSpacing: 1.5, fontWeight: FontWeight.bold),
          headline1: TextStyle(fontWeight: FontWeight.bold),
          subtitle1: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
