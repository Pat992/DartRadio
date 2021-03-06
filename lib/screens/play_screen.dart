import 'package:dart_radio/providers/preference_provider.dart';
import 'package:dart_radio/providers/stations_provider.dart';
import 'package:dart_radio/widgets/play_main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayScreen extends StatelessWidget {
  static const ROUTE_NAME = '/play';

  @override
  Widget build(BuildContext context) {
    var _stationProvider = Provider.of<StationsProvider>(context);
    var _preferenceProvider = Provider.of<PreferenceProvider>(context);
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
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
                child: IconButton(
                  icon: _stationProvider.getIsFavorite(_preferenceProvider.favorites)? Icon(Icons.star) : Icon(Icons.star_border),
                  onPressed: (){
                    Provider.of<PreferenceProvider>(context,listen: false).toggleFavorites(_stationProvider.currentStation.name);
                    _stationProvider.setUnsetFavorite(Provider.of<PreferenceProvider>(context,listen: false).favorites);
                    },
                ),
            ),
          ],
        ),
        body: Container(
          child: PlayMain(),
        ));
  }
}
