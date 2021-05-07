import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizapp/tutorials/bloc_todo/cubit/todos_cubit.dart' as cubit;
import 'package:quizapp/tutorials/bloc_todo/screens/todo_form.dart';
import 'package:quizapp/tutorials/bloc_todo/screens/todos.dart';

final todosCubit = cubit.TodosCubit();

class BlocTodo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (router) {
        switch (router.name) {
          case '/':
            return MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                value: todosCubit,
                child: Todos(),
              ),
            );
          case '/add-todo':
            return MaterialPageRoute(builder: (_) => TodoForm());
          case '/edit-todo':
            return MaterialPageRoute(builder: (_) => TodoForm(edit: true));
          default:
            throw (UnimplementedError('Unimplemented Screen'));
        }
      },
    );
  }
}
