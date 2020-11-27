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

    return FutureBuilder(
        future: Provider.of<SongProvider>(context)
            .setSongByUrl(stationsProvider.currentStation.songUrl),
        builder: (context, future) {
          if (future.hasData)
            return Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      '${stationsProvider.currentStation.image}',
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('${songProvider.song.artist}'),
                    SizedBox(
                      height: 10,
                    ),
                    Text('${songProvider.song.title}'),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: TimeProgress(),
                    ),
                  ],
                ),
              ),
            );
          return Text("loading...");
        });
  }
}
