import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/counter_cubit.dart';

class CounterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("builds on every change"),
        BlocBuilder<CounterCubit, int>(
          builder: (_, count) {
            return Text(
              "$count",
              style: TextStyle(
                fontSize: 25,
              ),
            );
          },
        ),
        SizedBox(
          height: 15,
        ),
        Text("builds for only Event Numbers"),
        BlocBuilder<CounterCubit, int>(
          buildWhen: (pState, state) => state % 2 == 0,
          builder: (_, count) {
            return Text(
              "$count",
              style: TextStyle(fontSize: 25),
            );
          },
        ),
        SizedBox(
          height: 15,
        ),
        Text("builds for only Odd Numbers"),
        BlocBuilder<CounterCubit, int>(
          buildWhen: (pState, state) => state % 2 != 0,
          builder: (_, count) {
            return Text(
              "$count",
              style: TextStyle(fontSize: 25),
            );
          },
        ),
      ],
    );
  }
}
