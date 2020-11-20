import 'package:dart_radio/providers/preference_provider.dart';
import 'package:dart_radio/screens/radio_mobile_screen.dart';
import 'package:dart_radio/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    getPreferences();
    super.initState();
  }

  Future<void> getPreferences() async {
    await Provider.of<PreferenceProvider>(context, listen: false)
        .initPreferences();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<PreferenceProvider>(context).initPreferences();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DartRadio',
      theme: Provider.of<PreferenceProvider>(context).isDarkTheme
          ? darkTheme
          : lightTheme,
      routes: {RadioMobileScreen.ROUTE_NAME: (context) => RadioMobileScreen()},
    );
  }
}
