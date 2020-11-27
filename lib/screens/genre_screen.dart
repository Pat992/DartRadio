import 'package:dart_radio/widgets/genre_list.dart';
import 'package:dart_radio/widgets/search_list.dart';
import 'package:flutter/material.dart';

class GenreScreen extends StatelessWidget {
  static const ROUTE_NAME = '/genre';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchList(searchStations:false),
      body: GenreList(),
    );
  }
}