import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './counter_view.dart';
import '../cubit/counter_cubit.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext buildContext) {
    final counter = buildContext.read<CounterCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
      ),
      body: Center(
        child: CounterView(),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: counter.increment,
          ),
          SizedBox(height: 12),
          FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: counter.decrement,
          )
        ],
      ),
    );
  }
}
