import 'package:dart_radio/providers/song_provider.dart';
import 'package:dart_radio/providers/stations_provider.dart';
import 'package:dart_radio/widgets/time_progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayMain extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final stationsProvider = Provider.of<StationsProvider>(context);
    final songProvider = Provider.of<SongProvider>(context);

    var _height = MediaQuery.of(context).size.height;
    return FutureBuilder(
      future: Provider.of<SongProvider>(context)
          .setSongByUrl(stationsProvider.currentStation.songUrl),
      builder: (context, future) => Column(
        children: [
          SizedBox(
              height: _height * 0.2,
              child: Text('${stationsProvider.currentStation.displayName}')
          ),
          SizedBox(
            height: _height * 0.5,
            child: Row(
              children: <Widget>[
                Text("arr right"),
                Image.network('${stationsProvider.currentStation.image}'),
                Text("arr left")
              ],
            ),
          ),
          Text('${songProvider.song.artist}'),
          Text('${songProvider.song.title}'),
          Container(
            child: TimeProgress(),
          ),
          Text("stop/play Btn")
        ],
      ),
    );
  }
}
