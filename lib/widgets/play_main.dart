import 'package:dart_radio/models/station.dart';
import 'package:dart_radio/providers/player_provider.dart';
import 'package:dart_radio/providers/preference_provider.dart';
import 'package:dart_radio/providers/song_provider.dart';
import 'package:dart_radio/providers/stations_provider.dart';
import 'package:dart_radio/widgets/time_progress.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:async/async.dart';

class PlayMain extends StatelessWidget {
  //memoizer to detect if song Object instance has changed
  AsyncMemoizer _memoizer = AsyncMemoizer();

  @override
  Widget build(BuildContext context) {
    final stationsProvider = Provider.of<StationsProvider>(context);
    final preferenceProvider = Provider.of<PreferenceProvider>(context);
    final songProvider = Provider.of<SongProvider>(context);
    final player = Provider.of<PlayerProvider>(context);
    final currentStation = stationsProvider.currentStation;

    if (songProvider.fetchNewSongCheck()) {
      songProvider.setSongByUrl(stationsProvider.currentStation.songUrl);
    }

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
                : Container(
                    width: MediaQuery.of(context).size.height * 0.9,
                    height: 200,
                    padding: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network(
                              '${stationsProvider.currentStation.image}',
                              height: MediaQuery.of(context).size.height * 0.8,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            TimeProgress(),
                            SizedBox(
                              width: 10,
                            ),
                            player.isPlaying
                                ? IconButton(
                                    icon: Icon(Icons.stop),
                                    color: Theme.of(context).primaryColor,
                                    onPressed: () {
                                      player.stop();
                                    },
                                  )
                                : IconButton(
                                    icon: Icon(Icons.play_arrow),
                                    color: Theme.of(context).primaryColor,
                                    onPressed: () {
                                      player.play(currentStation.streamUrl);
                                    },
                                  ),
                          ],
                        ),
                        IconButton(
                          icon: stationsProvider
                                  .getIsFavorite(preferenceProvider.favorites)
                              ? Icon(Icons.star)
                              : Icon(Icons.star_border),
                          onPressed: () {
                            Provider.of<PreferenceProvider>(context,
                                    listen: false)
                                .toggleFavorites(
                                    stationsProvider.currentStation.name);
                            stationsProvider.setUnsetFavorite(
                                Provider.of<PreferenceProvider>(context,
                                        listen: false)
                                    .favorites);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.close),
                          color: Theme.of(context).primaryColor,
                          onPressed: () {
                            stationsProvider.setCurrentStation(Station());
                            player.stop();
                          },
                        ),
                      ],
                    ),
                  );
          return Text("loading...");
        });
  }
}
