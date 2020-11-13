import 'package:dart_radio/screens/play_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DartRadio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PlayScreen(),
    );
  }
}
