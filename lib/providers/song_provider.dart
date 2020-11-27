import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:dart_radio/helper/song_time_helper.dart';
import 'package:dart_radio/models/song.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';

class SongProvider with ChangeNotifier {

  DateTime TEST_START = DateTime.now().subtract(new Duration(seconds: 52));
  DateTime TEST_END = DateTime.now().add(new Duration(seconds: 111));

  Song _song;
  SongTimeHelper _songTimeHelper;
  Timer _timer;

  String _timeToFinishFormatted;
  String _durationFormatted;
  int _percentDone;

  SongProvider(){

    this._songTimeHelper = new SongTimeHelper(TEST_START, TEST_END);
    setThisState();
    _createTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Timer _createTimer(){
    return Timer.periodic (Duration(milliseconds: 300), (Timer t) {
      setThisState();
      notifyListeners();
    });
  }

  get song{
    return _song;
  }

  set song(Song value){
    this._song = value;
    this._songTimeHelper = new SongTimeHelper(value.startedAt, value.endsAt);
    // this._songTimeHelper = new SongTimeHelper(TEST_START, TEST_END);
  }

  Future<void> setSongByUrl(String songUrl) async{
    final response = await http.get(songUrl);
    final extractedJson = json.decode(response.body);
    final song = Song.fromJson(extractedJson);
    this.song = song;
  }

  setThisState(){
    this._durationFormatted = this._songTimeHelper.durationFormatted();
    this._percentDone = this._songTimeHelper.percentPlayed();
    this._timeToFinishFormatted = this._songTimeHelper.timeToFinishFormatted();
  }

  get timeToFinishFormatted{
    return _timeToFinishFormatted;
  }

  get percentDone{
    return _percentDone;
  }

  get durationFormatted{
    return _durationFormatted;
  }

  String getTTF(){
    return "d";
  }

  int getPd(){
    return 1;
  }

  String getDurF(){
    return "4";
  }



}
