import 'package:dart_radio/providers/stations_provider.dart';
import 'package:dart_radio/widgets/play_main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayScreen extends StatelessWidget {
  static const ROUTE_NAME = '/play';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          bottom: PreferredSize(
            child: Container(
              color: Theme.of(context).accentColor,
              height: 2.0,
            ),
            preferredSize: Size.fromHeight(4.0),
          ),
          title: Text(Provider.of<StationsProvider>(context)
              .currentStation
              .displayName),
        ),
        body: Container(
          child: PlayMain(),
        ));
  }
}
