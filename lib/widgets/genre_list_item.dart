import 'package:flutter/material.dart';

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
            onTap: (/*TODO: take taped genre as filter*/) { },
          ),
          Divider(
            color: Theme.of(context).accentColor,
          ),
        ],
      ),
    );
  }
}