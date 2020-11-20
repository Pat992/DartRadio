import 'package:dart_radio/models/song.dart';
import 'package:dart_radio/providers/song_provider.dart';
import 'package:dart_radio/screens/play_screen.dart';
import 'package:dart_radio/providers/preference_provider.dart';
import 'package:dart_radio/screens/main_screen.dart';
import 'package:dart_radio/providers/stations_provider.dart';
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
        ChangeNotifierProvider(create: (context) => StationsProvider()),
        ChangeNotifierProvider(create: (context) => SongProvider()),
        ChangeNotifierProvider(create: (context) => PreferenceProvider())
      ],
      child: MainScreen(),
    );
  }
}
