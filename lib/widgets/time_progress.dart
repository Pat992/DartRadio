import 'package:dart_radio/providers/song_provider.dart';
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('${songProvider.getTimeToFinishFormatted()}',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          SizedBox(
            width: 100,
            child: FAProgressBar(
              currentValue: songProvider.getpercentDone(),
              animatedDuration:	const Duration(milliseconds: 300),
              progressColor: Colors.green,
              size: 10
            ),
          ),
          Text('${songProvider.getDurationFormatted()}',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
