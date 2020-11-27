import 'package:dart_radio/providers/preference_provider.dart';
import 'package:dart_radio/providers/stations_provider.dart';
import 'package:dart_radio/widgets/play_main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayScreen extends StatelessWidget {
  static const ROUTE_NAME = '/play';
  Icon _favoriteIcon = Icon(Icons.star);


  @override
  Widget build(BuildContext context) {
    var _stationProvider = Provider.of<StationsProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('DartRadio'),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
                child: IconButton(
                  icon: _favoriteIcon,
                  onPressed: (){
                    Provider.of<PreferenceProvider>(context,listen: false).toggleFavorites(_stationProvider.currentStation.name);
                    _stationProvider.setUnsetFavorite(Provider.of<PreferenceProvider>(context,listen: false).favorites);
                    },
                ),

            ),
          ],
        ),
        body: Container(
          child: new PlayMain(),
        ));
  }
}
