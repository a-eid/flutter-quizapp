import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:quizapp/tutorials/state_management/bloc/home.dart';
import './store/counter.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocHome(),
      // home: MobxHome(),
    );
  }
}

final counter = Counter();

class MobxHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mobx Counter"),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.green,
        constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Observer(builder: (_) {
              print('re-render here ');
              return Text('here');
            }),
            Observer(builder: (_) {
              print('re-render ${counter.value}');
              return Text('${counter.value}');
            }),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 24),
                Expanded(
                  child: ElevatedButton(
                    onPressed: counter.reset,
                    child: Text("Reset"),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: counter.increment,
                    child: Text("increment"),
                  ),
                ),
                SizedBox(width: 24),
              ],
            )
          ],
        ),
      ),
    );
  }
}
