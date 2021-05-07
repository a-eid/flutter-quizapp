// import 'package:flutter/material.dart';
// // import 'package:quizapp/tutorials/HttpRequest.dart';
// import 'package:quizapp/tutorials/StateManagement.dart';

// class Main extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       // home: HttpRequest(),
//       home: StateManagement(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import './bloc_todo/bloc_todo.dart';
// import './bloc_counter/counter.dart';

void main() {
  // runApp(Counter());
  runApp(BlocTodo());
}
