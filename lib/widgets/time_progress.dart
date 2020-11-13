import 'package:dart_radio/helper/song_time_helper.dart';
import 'package:flutter/material.dart';

class TimeProgress extends StatefulWidget {


  final SongTimeHelper songTime;

  // TODO add param for the start and endtime
  TimeProgress({this.songTime});

  @override
  _TimeProgressState createState() => _TimeProgressState();
}

class _TimeProgressState extends State<TimeProgress> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('${widget.songTime.minutesLeft()} : ${widget.songTime.minutesLeft()}',
          style: TextStyle(
            fontSize: 22
          ),
        ),
        Text('${widget.songTime.timeLeft()}')
      ],

    );
  }
}
