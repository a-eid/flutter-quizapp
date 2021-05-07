import 'package:flutter/material.dart';

class BlocHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('counter'),
      ),
      body: Center(
        child: Text(''),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
          SizedBox(width: 12),
          FloatingActionButton(
              child: Icon(Icons.minimize_sharp), onPressed: () {})
        ],
      ),
    );
  }
}
