import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/main.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.bolt), label: "About"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        fixedColor: Colors.deepOrange,
        onTap: (value) {
          switch (value) {
            case 0:
              break;
            case 1:
              Navigator.of(context).pushNamed('/about');
              break;
            case 2:
              Navigator.of(context).pushNamed('/profile');
              break;
          }
        },
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
