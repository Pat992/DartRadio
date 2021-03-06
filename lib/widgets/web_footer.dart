import 'package:dart_radio/providers/stations_provider.dart';
import 'package:dart_radio/widgets/play_main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WebFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final stationsProvider = Provider.of<StationsProvider>(context);
    return AnimatedContainer(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Theme.of(context).primaryColor,
              blurRadius: 1,
              spreadRadius: 1)
        ],
        color: Theme.of(context).backgroundColor,
      ),
      height: stationsProvider.currentStation.name != null ? 200 : 0,
      duration: Duration(milliseconds: 150),
      width: MediaQuery.of(context).size.width,
      child: stationsProvider.currentStation.name != null ? PlayMain() : null,
    );
  }
}
