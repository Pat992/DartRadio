import 'package:flutter/material.dart';

class SongTimeHelper {

  DateTime _startdate;
  DateTime _enddate;
  Duration _songDuration;

  SongTimeHelper(startdate, enddate){
    this._startdate = startdate;
    this._enddate = enddate;
    _songDuration = _calculateDuration(this._startdate, this._enddate);
  }

  get duration{
    return _songDuration;
  }

  Duration _calculateDuration(startTime, endTime){
    return startTime.difference(endTime);
  }

  Duration timeLeft(){
    return DateTime.now().difference(_enddate);
  }

  int minutesLeft(){
    return timeLeft().inMinutes;
  }

  int secondsLeft(){
    return timeLeft().inSeconds - (timeLeft().inMinutes * 60);
  }

}
