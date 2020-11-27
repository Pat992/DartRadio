import 'package:dart_radio/models/station.dart';
import 'package:dart_radio/providers/player_provider.dart';
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
        .getApiInformation();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final player = Provider.of<PlayerProvider>(context);
    final stationsProvider = Provider.of<StationsProvider>(context);
    final List<Station> stations = stationsProvider.stations;

    return _isLoading
        ? Center(child: CircularProgressIndicator())
        : Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: stations.length,
                  itemBuilder: (context, index) => StationListItem(
                    key: ValueKey(stations[index].name),
                    title: stations[index].displayName,
                    description: stations[index].description,
                    imageUrl: stations[index].image,
                    streamUrl: stations[index].streamUrl,
                    startPlaying: (String url) {
                      stationsProvider.setCurrentStation(stations[index]);
                      player.play(url);
                      Navigator.pushNamed(context, '/play');
                    },
                  ),
                ),
              ),
              AnimatedContainer(
                color: Theme.of(context).accentColor,
                height: player.isPlaying ? 70 : 0,
                duration: Duration(milliseconds: 200),
                width: MediaQuery.of(context).size.width,
                child: IconButton(
                  icon: Icon(Icons.stop_circle_outlined),
                  onPressed: () {
                    player.stop();
                    stationsProvider.setCurrentStation(Station());
                  },
                ),
              ),
            ],
          );
  }
}
