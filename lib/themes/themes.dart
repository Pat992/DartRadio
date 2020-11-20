import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  backgroundColor: Color.fromRGBO(244, 244, 242, 1.0),
  accentColor: Color.fromRGBO(187, 191, 202, 1.0),
  primaryColor: Color.fromRGBO(73, 84, 100, 1.0),
  primaryColorLight: Color.fromRGBO(232, 232, 232, 1.0),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      color: Color.fromRGBO(73, 84, 100, 1.0),
    ),
    bodyText2: TextStyle(
      color: Color.fromRGBO(187, 191, 202, 1.0),
    ),
  ),
);
final darkTheme = ThemeData(
  backgroundColor: Color.fromRGBO(28, 43, 45, 1.0),
  primaryColor: Color.fromRGBO(31, 111, 139, 1.0),
  accentColor: Color.fromRGBO(153, 168, 178, 1.0),
  primaryColorLight: Color.fromRGBO(28, 43, 45, 1.0),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      color: Color.fromRGBO(31, 111, 139, 1.0),
    ),
    bodyText2: TextStyle(
      color: Color.fromRGBO(230, 213, 184, 1.0),
    ),
  ),
);
