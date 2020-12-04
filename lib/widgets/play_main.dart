import 'package:dart_radio/providers/player_provider.dart';
import 'package:dart_radio/providers/song_provider.dart';
import 'package:dart_radio/providers/stations_provider.dart';
import 'package:dart_radio/widgets/time_progress.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:async/async.dart';

class PlayMain extends StatelessWidget {
  AsyncMemoizer _memoizer = AsyncMemoizer();

  @override
  Widget build(BuildContext context) {
    final stationsProvider = Provider.of<StationsProvider>(context);
    final player = Provider.of<PlayerProvider>(context);
    final currentStation = stationsProvider.currentStation;

    return FutureBuilder(
        future: this._memoizer.runOnce(() async {
          return Provider.of<SongProvider>(context)
              .setSongByUrl(stationsProvider.currentStation.songUrl);
        }),
        builder: (context, future) {
          if (future.hasData)
            return !kIsWeb
                ? Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Hero(
                            tag: stationsProvider.currentStation.displayName,
                            child: Image.network(
                              '${stationsProvider.currentStation.image}',
                              width: MediaQuery.of(context).size.width * 0.8,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: TimeProgress(),
                          ),
                          player.isPlaying
                              ? IconButton(
                                  icon: Icon(Icons.stop),
                                  onPressed: () {
                                    player.stop();
                                  },
                                )
                              : IconButton(
                                  icon: Icon(Icons.play_arrow),
                                  onPressed: () {
                                    player.play(currentStation.streamUrl);
                                  },
                                ),
                        ],
                      ),
                    ),
                  )
                : Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.height * 0.9,
                      height: 200,
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                            '${stationsProvider.currentStation.image}',
                            height: MediaQuery.of(context).size.height * 0.8,
                          ),
                          TimeProgress(),
                          player.isPlaying
                              ? IconButton(
                                  icon: Icon(Icons.stop),
                                  onPressed: () {
                                    player.stop();
                                  },
                                )
                              : IconButton(
                                  icon: Icon(Icons.play_arrow),
                                  onPressed: () {
                                    player.play(currentStation.streamUrl);
                                  },
                                ),
                        ],
                      ),
                    ),
                  );
          return Text("loading...");
        });
  }
}
