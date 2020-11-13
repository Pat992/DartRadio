import 'package:dart_radio/helper/song_time_helper.dart';
import 'package:flutter/material.dart';

class TimeProgress extends StatefulWidget {

  DateTime TEST_START = DateTime.now().subtract(new Duration(seconds: 52));
  DateTime TEST_END = DateTime.now().add(new Duration(seconds: 111));

  SongTimeHelper songTime;

  // TODO add param for the start and endtime
  TimeProgress(){
    this.songTime = new SongTimeHelper(TEST_START,TEST_END);
  }

  int getMinutes(){
    return songTime.minutesLeft();
  }

  @override
  _TimeProgressState createState() => _TimeProgressState();
}

class _TimeProgressState extends State<TimeProgress> {

  int _minutes;
  int _seconds;
  Duration _timeleft;
  SongTimeHelper songTime;

  @override
  void initState() {
    songTime = widget.songTime;
    _minutes = songTime.minutesLeft();
    _seconds = songTime.secondsLeft();
    _timeleft = songTime.timeLeft();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('$_minutes and $_seconds',
          style: TextStyle(
            fontSize: 22
          ),
        ),
        Text('$_timeleft')
      ],

    );
  }
}
