import 'package:dart_radio/helper/song_time_helper.dart';
import 'package:dart_radio/widgets/play_main.dart';
import 'package:dart_radio/widgets/time_progress.dart';
import 'package:flutter/material.dart';

class PlayScreen extends StatelessWidget {
  static const ROUTE_NAME = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DartRadio'),
      ),
      body: Container(
       child: new PlayMain(),
      )
    );

  }
}