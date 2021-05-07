import 'package:flutter/material.dart';
import 'package:quizapp/shared/shared.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Container(
        child: LanguageSwitcher(),
      ),
    );
  }
}
