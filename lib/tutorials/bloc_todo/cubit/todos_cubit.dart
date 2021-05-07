import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
abstract class TodosState {}

class Todos extends TodosState {}

class TodosLoading extends TodosState {}

class TodosCubit extends Cubit<TodosState> {
  TodosCubit() : super(Todos());
}
