import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TodoForm extends StatelessWidget {
  final bool edit;
  TodoForm({this.edit = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(edit ? "Edit Todo" : "Add Todo"),
      ),
      body: TextField(
        autofocus: true,
        decoration: InputDecoration(
          labelText: "here we go",
        ),
      ),
    );
  }
}
