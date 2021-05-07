import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}

class Bloc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(
          create: (BuildContext context) => CounterCubit(),
        ),
      ],
      child: MaterialApp(
        home: BlocHome(),
      ),
    );
  }
}

class BlocHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('counter'),
      ),
      body: BlocBuilder<CounterCubit, int>(
        buildWhen: (previousState, state) {
          return state % 2 == 0;
        },
        builder: (context, count) {
          return Center(
            child: Text(
              '$count',
              style: TextStyle(fontSize: 25),
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => context.read<CounterCubit>().increment(),
          ),
          SizedBox(width: 12),
          FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () => context.read<CounterCubit>().decrement(),
          )
        ],
      ),
    );
  }
}
