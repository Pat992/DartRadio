import 'package:dart_radio/widgets/side_drawer.dart';
import 'package:dart_radio/widgets/station_list.dart';
import 'package:flutter/material.dart';

class RadioMobileScreen extends StatelessWidget {
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
