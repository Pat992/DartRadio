import 'package:dart_radio/widgets/time_progress.dart';
import 'package:flutter/material.dart';

class PlayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new TimeProgress(),
    );
  }
}