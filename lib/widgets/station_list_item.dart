import 'package:flutter/material.dart';

class StationListItem extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String streamUrl;
  final Function(String streamUrl) startPlaying;

  const StationListItem(
      {Key key,
      this.title,
      this.description,
      this.imageUrl,
      this.streamUrl,
      this.startPlaying})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColorLight,
      child: Column(
        children: [
          ListTile(
            leading: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 44, minWidth: 44),
              child: Hero(
                tag: title,
                child: Image.network(imageUrl),
              ),
            ),
            title: Text(title, style: Theme.of(context).textTheme.bodyText1),
            subtitle: Text(
              description,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            onTap: () => startPlaying(streamUrl),
          ),
          Divider(
            color: Theme.of(context).accentColor,
          ),
        ],
      ),
    );
  }
}
