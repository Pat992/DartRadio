import 'package:dart_radio/providers/stations_provider.dart';
import 'package:dart_radio/widgets/station_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StationList extends StatefulWidget {
  @override
  _StationListState createState() => _StationListState();
}

class _StationListState extends State<StationList> {
  bool _isLoading = false;
  @override
  void initState() {
    callApi();
    super.initState();
  }

  Future<void> callApi() async {
    setState(() {
      _isLoading = true;
    });

    await Provider.of<StationsProvider>(context, listen: false)
        .getStationsFromApi();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    //List<Station> stations = [];
    final stationsProvider = Provider.of<StationsProvider>(context);
    final stations = stationsProvider.stations;

    return _isLoading
        ? CircularProgressIndicator()
        : ListView.builder(
            itemCount: stations.length,
            itemBuilder: (context, index) => StationListItem(
              key: ValueKey(stations[index].name),
              title: stations[index].displayName,
              description: stations[index].description,
              imageUrl: stations[index].image,
            ),
          );
  }
}
