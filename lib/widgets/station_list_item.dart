import 'package:flutter/material.dart';

class StationListItem extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const StationListItem({Key key, this.title, this.description, this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 44, minWidth: 44),
          child: Image.network(imageUrl)),
      title: Text(title),
      subtitle: Text(
        description,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () {},
    );
  }
}
