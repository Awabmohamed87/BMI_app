import 'package:flutter/material.dart';
import 'Result.dart';
import 'Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal, canvasColor: Colors.black),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/x': (context) => Result(),
      },
    );
  }
}
