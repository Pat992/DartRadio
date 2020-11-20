import 'package:dart_radio/providers/preference_provider.dart';
import 'package:dart_radio/widgets/side_drawer.dart';
import 'package:dart_radio/widgets/station_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RadioMobileScreen extends StatelessWidget {
  static const ROUTE_NAME = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DartRadio'),
      ),
      drawer: SideDrawer(),
      body: StationList(),
    );
  }
}
