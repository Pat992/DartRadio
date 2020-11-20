import 'dart:async';

import 'package:dart_radio/helper/song_time_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class TimeProgress extends StatefulWidget {

  SongTimeHelper songTime;

  // TODO add param for the start and endtime
  TimeProgress({this.songTime});

  @override
  _TimeProgressState createState() => _TimeProgressState();

}

class _TimeProgressState extends State<TimeProgress> {

  var seconds;
  var minutes;
  var percentDone;

  @override
  void initState() {
    super.initState();

    percentDone = widget.songTime.percentPlayed();
    Timer.periodic (Duration(milliseconds: 300), (Timer t) {
      setState( () {
        percentDone = widget.songTime.percentPlayed();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('${widget.songTime.timeToFinishFormatted()}',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width/100*80,
            child: FAProgressBar(
              currentValue: percentDone,
              animatedDuration:	const Duration(milliseconds: 300),
              progressColor: Colors.green,
              size: 10
            ),
          ),
          Text('${widget.songTime.durationFormatted()}',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
