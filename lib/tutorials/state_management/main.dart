import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import './store/counter.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

final counter = Counter();

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mobx Counter"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Observer(builder: (_) {
            return Text('${counter.value}');
          }),
          ElevatedButton(
            onPressed: counter.increment,
            child: Text("increment"),
          ),
        ],
      ),
    );
  }
}
