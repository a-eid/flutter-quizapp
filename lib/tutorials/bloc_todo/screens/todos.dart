import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Todos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todos"),
      ),
      body: SingleChildScrollView(
        dragStartBehavior: DragStartBehavior.down,

        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
            ),
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                labelText: "here we go",
              ),
            ),
            ElevatedButton(
              child: Text("Add Todo"),
              onPressed: () {
                Navigator.pushNamed(context, '/add-todo');
              },
            ),
            ElevatedButton(
              child: Text("Edit Todo"),
              onPressed: () {
                Navigator.pushNamed(context, '/edit-todo');
              },
            ),
          ],
        ),
      ),
    );
  }
}
