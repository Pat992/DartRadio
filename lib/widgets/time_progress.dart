import 'package:dart_radio/providers/song_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:provider/provider.dart';

class TimeProgress extends StatefulWidget {
  @override
  _TimeProgressState createState() => _TimeProgressState();
}

class _TimeProgressState extends State<TimeProgress> {
  @override
  Widget build(BuildContext context) {
    final songProvider = Provider.of<SongProvider>(context);
    return Center(
      child: Container(
        width: kIsWeb
            ? MediaQuery.of(context).size.width * 0.4
            : MediaQuery.of(context).size.width * 0.9,
        child: Column(
          children: <Widget>[
            Text('${songProvider.song.artist}'),
            SizedBox(
              height: 10,
            ),
            Text('${songProvider.song.title}'),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${songProvider.timeToFinishFormatted}',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: FAProgressBar(
                      currentValue: songProvider.percentDone,
                      animatedDuration: const Duration(milliseconds: 300),
                      progressColor: Theme.of(context).primaryColor,
                      backgroundColor: Theme.of(context).accentColor,
                      size: 5),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '${songProvider.durationFormatted}',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
