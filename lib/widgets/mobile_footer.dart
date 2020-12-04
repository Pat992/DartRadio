import 'package:dart_radio/providers/player_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MobileFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final player = Provider.of<PlayerProvider>(context);
    return AnimatedContainer(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Theme.of(context).primaryColor,
              blurRadius: 1,
              spreadRadius: 1)
        ],
        color: Theme.of(context).accentColor,
      ),
      height: player.isPlaying ? 60 : 0,
      duration: Duration(milliseconds: 200),
      width: MediaQuery.of(context).size.width,
      child: IconButton(
        icon: Icon(Icons.stop_circle_outlined),
        onPressed: () {
          player.stop();
        },
      ),
    );
  }
}
