import 'package:dart_radio/providers/song_provider.dart';
import 'package:dart_radio/providers/stations_provider.dart';
import 'package:dart_radio/widgets/time_progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:async/async.dart';

class PlayMain extends StatelessWidget {

  AsyncMemoizer _memoizer = AsyncMemoizer();

  @override
  Widget build(BuildContext context) {
    final stationsProvider = Provider.of<StationsProvider>(context);
    final songProvider = Provider.of<SongProvider>(context);

   if(songProvider.checkSongFinished()){
    songProvider.setSongByUrl(stationsProvider.currentStation.songUrl);
   }

    var _height = MediaQuery.of(context).size.height;
    return FutureBuilder(
      future:  this._memoizer.runOnce(() async {
      return Provider.of<SongProvider>(context)
          .setSongByUrl(stationsProvider.currentStation.songUrl);
    }),
      builder: (context, future)
      {
        if (future.hasData)
              return Column(
                children: [
                  SizedBox(
                      height: _height * 0.2,
                      child: Text(
                          '${stationsProvider.currentStation.displayName}')),
                  SizedBox(
                    height: _height * 0.5,
                    child: Row(
                      children: <Widget>[
                        Text("arr right"),
                        Image.network(
                            '${stationsProvider.currentStation.image}'),
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
              );
         return Text("loading...");
      }
      );
  }
}
