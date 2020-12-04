import 'package:dart_radio/providers/preference_provider.dart';
import 'package:dart_radio/screens/genre_screen.dart';
import 'package:dart_radio/screens/play_screen.dart';
import 'package:dart_radio/screens/radio_mobile_screen.dart';
import 'package:dart_radio/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<PreferenceProvider>(context).initPreferences();

    return FutureBuilder(
      future: Provider.of<PreferenceProvider>(context).initPreferences(),
      builder: (context, future) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DartRadio',
        theme: Provider.of<PreferenceProvider>(context).isDarkTheme
            ? darkTheme
            : lightTheme,
        routes: {
          RadioMobileScreen.ROUTE_NAME: (context) => RadioMobileScreen(),
          GenreScreen.ROUTE_NAME: (context) => GenreScreen(),
          PlayScreen.ROUTE_NAME: (context) => PlayScreen()
        },
      ),
    );
  }
}
