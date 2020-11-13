import 'package:dart_radio/screens/play_screen.dart';
import 'package:dart_radio/providers/stations_provider.dart';
import 'package:dart_radio/screens/radio_mobile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StationsProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DartRadio',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          //RadioMobileScreen.ROUTE_NAME: (context) => RadioMobileScreen(),
          PlayScreen.ROUTE_NAME: (context) => PlayScreen()
        },
      ),
    );
  }
}
