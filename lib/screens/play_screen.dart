import 'package:dart_radio/helper/song_time_helper.dart';
import 'package:dart_radio/widgets/time_progress.dart';
import 'package:flutter/material.dart';

class PlayScreen extends StatelessWidget {
  static const ROUTE_NAME = '/';
  //This is for test purposes
  DateTime TEST_START = DateTime.now().subtract(new Duration(seconds: 52));
  DateTime TEST_END = DateTime.now().add(new Duration(seconds: 111));

  SongTimeHelper songTime;

  PlayScreen(){
    this.songTime = new SongTimeHelper(TEST_START,TEST_END);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       child: new TimeProgress(songTime: this.songTime),
      )
    );

  }
}