import 'dart:async';

import 'package:dart_radio/helper/song_time_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class TimeProgress extends StatefulWidget {

  SongTimeHelper songTime;
  var timer;
  var seconds;
  var minutes;
  var duration;
  var percentDone;

  // TODO add param for the start and endtime
  TimeProgress({this.songTime});

  @override
  _TimeProgressState createState() => _TimeProgressState();

}

class _TimeProgressState extends State<TimeProgress> {

  var timer;
  var seconds;
  var minutes;
  var percentDone;

  @override
  void initState() {
    super.initState();
    Timer.periodic (Duration(milliseconds: 150), (Timer t) {
      setState( () {
        seconds = widget.songTime.secondsLeft();
        minutes = widget.songTime.minutesLeft();
        percentDone = widget.songTime.percentPlayed();
      });
    });
    // seconds = widget.songTime.secondsLeft();
    // minutes = widget.songTime.minutesLeft();
    // percentDone = widget.songTime.percentPlayed();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('${ seconds } : ${ minutes }',
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        Text('${ widget.songTime.duration }'),
        FAProgressBar(
          currentValue: widget.songTime.percentPlayed() ,
        )
      ],
    );
  }
}
