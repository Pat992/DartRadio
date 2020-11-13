import 'package:dart_radio/providers/stations_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StationList extends StatefulWidget {
  @override
  _StationListState createState() => _StationListState();
}

class _StationListState extends State<StationList> {
  @override
  void initState() async {
    await Provider.of<StationsProvider>(context, listen: false)
        .getStationsFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //List<Station> stations = [];
    final stationsProvider = Provider.of<StationsProvider>(context);
    final stations = stationsProvider.stations;

    return ListView.builder(
      itemCount: stations.length,
      itemBuilder: (context, index) => Text(stations[index].displayName),
    );
  }
}
