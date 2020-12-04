import 'package:dart_radio/providers/stations_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GenreListItem extends StatelessWidget {
  final String title;

  const GenreListItem(
      {Key key,
      this.title
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColorLight,
      child: Column(
        children: [
          ListTile(
            title: Text(title, style: Theme.of(context).textTheme.bodyText1),
            onTap: () {
              Provider.of<StationsProvider>(context, listen: false).getStationsByGenre(genres: title);
              Navigator.pop(context);
            },
          ),
          Divider(
            color: Theme.of(context).accentColor,
          ),
        ],
      ),
    );
  }
}