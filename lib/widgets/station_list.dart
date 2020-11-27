import 'package:dart_radio/helper/player_helper.dart';
import 'package:dart_radio/models/station.dart';
import 'package:dart_radio/providers/song_provider.dart';
import 'package:dart_radio/providers/stations_provider.dart';
import 'package:dart_radio/widgets/station_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StationList extends StatefulWidget {
  @override
  _StationListState createState() => _StationListState();
}

class _StationListState extends State<StationList> {
  PlayerHelper _player = PlayerHelper();
  bool _isPlaying = false;

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

  Future<void> _startPlay(String songUrl) async {
    await _player.play(songUrl);
    setState(() {
      _isPlaying = true;
    });
  }

  void _stopPlay() {
    setState(() {
      _player.stop();
      _isPlaying = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    //List<Station> stations = [];
    final stationsProvider = Provider.of<StationsProvider>(context);
    final songProvider = Provider.of<SongProvider>(context);
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
                      _startPlay(url);
                      songProvider.song = null; //reset current song
                      Navigator.pushNamed(
                          context,
                          '/play'
                      );
                    },
                  ),
                ),
              ),
              AnimatedContainer(
                color: Theme.of(context).accentColor,
                height: _isPlaying ? 70 : 0,
                duration: Duration(milliseconds: 200),
                width: MediaQuery.of(context).size.width,
                child: IconButton(
                  icon: Icon(Icons.stop_circle_outlined),
                  onPressed: () {
                    _stopPlay();
                    stationsProvider.setCurrentStation(Station());
                  },
                ),
              ),
            ],
          );
  }
}
