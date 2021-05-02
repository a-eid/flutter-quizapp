import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class SS extends ChangeNotifier {
  String value = "here we goo!!";

  void change(String val) {
    value = val;
    notifyListeners();
  }
}

StreamController<String> ctl = StreamController<String>();
Stream<String> stream = ctl.stream;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SS>(create: (_) => SS()),
        StreamProvider<String>(
          create: (_) => stream,
          initialData: '2',
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  Home({this.title = "Home"});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Counter(),
      // drawer: Drawer(),
    );
  }
}

class Counter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Counter();
  }
}

class _Counter extends State<Counter> {
  int count = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Container(
          child: Column(
            children: [
              Container(height: 150, color: Colors.lightBlue),
              Container(height: 150, color: Colors.red),
              Container(height: 150, color: Colors.green),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                ),
                onPressed: () {
                  setState(() {
                    count += 2;
                  });
                },
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    setState(() {
                      count++;
                    });
                  },
                  child: Text(
                    "$count",
                    style: TextStyle(color: Colors.black, fontSize: 32),
                  ),
                ),
              ),
              CustomButton(),
              CustomButton2()
            ],
          ),
        ),
      ),
    );
    // return ;
  }
}

class CustomButton2 extends StatelessWidget {
  int val = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(Provider.of<String>(context)),
        Text(Provider.of<String>(context)),
        ElevatedButton(
          onPressed: () async {
            val++;
            ctl.sink.add('$val');
            // print(last ? last : "no last");
            // ctl.add('1');
            // stream.pipe();
          },
          child: Text("Incc"),
        )
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SS>(
      builder: (ctx, ss, _) {
        return ElevatedButton(
          onPressed: () {
            ss.change(ss.value == "new value" ? "old value" : "new value");
          },
          child: Text(ss.value),
        );
      },
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return ElevatedButton(
  //     onPressed: () {
  //       Provider.of<SS>(context).change("here we ... are");
  //       // context.select((value) => "");
  //       // Navigator.push(
  //       //   context,
  //       //   MaterialPageRoute(
  //       //     builder: (context) => Home(),
  //       //   ),
  //       // );
  //     },
  //     child: Text(Provider.of<SS>(context).value),
  //     // child: Text(Provider.of<String>(context)),
  //   );
  // }
}
