import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:quizapp/tutorials/Main.dart';
import 'package:quizapp/tutorials/navigation/main.dart';

import 'screens/screens.dart' as Screens;

void main() {
  // runApp(App());
  // runApp(Main());
  runApp(NavigationExample());
}

class LocalProvider extends ChangeNotifier {
  Locale _value = Locale('en', '');
  Locale get value => _value;

  void change(Locale locale) {
    _value = locale;
    print(locale.toString());
    notifyListeners();
  }
}

List<Locale> locales = const [
  Locale('ar', ''),
  Locale('en', ''),
];

// class Bootstrap extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider<LocalProvider>(
//           create: (_) => LocalProvider(),
//         ),
//       ],
//       child: App(),
//     );
//   }
// }

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LocalProvider(),
      builder: (BuildContext context, widget) => MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        // locale: Provider.of<LocalProvider>(context).value,
        supportedLocales: locales,
        locale: Provider.of<LocalProvider>(context).value,
        // supportedLocales: [Locale('en', 'US')],
        // init firebase analytics so we get automatic reporting from firebase.
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: FirebaseAnalytics())
        ],
        // home: Screens.Home(),
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
      ),
    );
  }
}
