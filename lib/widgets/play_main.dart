import 'package:dart_radio/widgets/time_progress.dart';
import 'package:flutter/material.dart';

class PlayMain extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    var _heigth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
            height: _heigth * 0.2,
            child: Text("Radiosender")
        ),
        SizedBox(
          height: _heigth * 0.5,
          child: Row(
            children: <Widget>[
              Text("arr right"),
              Text("Image"),
              Text("arr left")
            ],
          ),
        ),
        Text("bandname"),
        Text("song"),
        Container(
          child: new TimeProgress(),
        ),
        Text("stop/play Btn")
      ],
    );
  }
}
