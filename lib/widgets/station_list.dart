import 'package:dart_radio/widgets/station_list_item.dart';
import 'package:flutter/material.dart';

class StationList extends StatefulWidget {
  @override
  _StationListState createState() => _StationListState();
}

class _StationListState extends State<StationList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) => StationListItem(),
    );
  }
}
