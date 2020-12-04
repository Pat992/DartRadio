import 'package:dart_radio/providers/preference_provider.dart';
import 'package:dart_radio/providers/stations_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var favorites = Provider.of<PreferenceProvider>(context).favorites;
    return Drawer(
      child: Container(
        color: Theme.of(context).accentColor,
        child: Column(
          children: <Widget>[
            AppBar(
              title: Text('Menu'),
              automaticallyImplyLeading: false,
            ),
            ListTile(
              leading: Icon(
                Icons.star,
                color: Theme.of(context).backgroundColor,
              ),
              title: Text(
                'Favorites',
                style: TextStyle(color: Theme.of(context).backgroundColor),
              ),
              onTap: () {
                Scaffold.of(context).openDrawer();
                Provider.of<StationsProvider>(context, listen: false)
                    .toggleFavoriteStations(favorites: favorites);
                Navigator.of(context).pop();
              },

            ),
            ListTile(
              leading: Icon(
                Icons.list,
                color: Theme.of(context).backgroundColor,
              ),
              title: Text(
                'Genres',
                style: TextStyle(color: Theme.of(context).backgroundColor),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(
                  context,
                  '/genre'
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.brightness_4,
                color: Theme.of(context).backgroundColor,
              ),
              title: Text(
                'Dark Theme',
                style: TextStyle(color: Theme.of(context).backgroundColor),
              ),
              trailing: Switch(
                activeColor: Theme.of(context).primaryColor,
                value: Provider.of<PreferenceProvider>(context).isDarkTheme,
                onChanged: (value) {
                  Provider.of<PreferenceProvider>(context, listen: false)
                      .setDarkTheme(value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
