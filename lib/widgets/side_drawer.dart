import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).accentColor,
        child: Column(
          children: <Widget>[
            AppBar(
              title: Text('App Drawer title'),
              automaticallyImplyLeading: false,
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.star,
                color: Theme.of(context).backgroundColor,
              ),
              title: Text(
                'Favorites',
                style: TextStyle(color: Theme.of(context).backgroundColor),
              ),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
