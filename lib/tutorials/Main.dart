import 'package:flutter/material.dart';
// import 'package:quizapp/tutorials/HttpRequest.dart';
import 'package:quizapp/tutorials/StateManagement.dart';

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HttpRequest(),
      home: StateManagement(),
    );
  }
}
