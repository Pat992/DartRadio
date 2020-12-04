import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:dart_radio/helper/song_time_helper.dart';
import 'package:dart_radio/models/song.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';

class SongProvider with ChangeNotifier {

  Song _song;
  SongTimeHelper _songTimeHelper;
  Timer _timer;

  Timer _delayFetchTimer;
  bool _delayFetchFlag = true;

  String _timeToFinishFormatted;
  String _durationFormatted;
  int _percentDone;

  SongProvider(){

    this._songTimeHelper = new SongTimeHelper(
        DateTime.now().subtract(new Duration(seconds: 1)),
        DateTime.now().add(new Duration(seconds: 1))
    );
    setThisState();
    _timer = _createTimer();
  }

  @override
  void dispose() {
    this._cancelTimers();
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
  }



  Future<bool> setSongByUrl(String songUrl) async{
    try{
      final response = await http.get(songUrl);
      final extractedJson = json.decode(response.body);
      final song = Song.fromJson(extractedJson);
      this.song = song;
      return true;
    }catch(e){
      print(e);
      return false;
    }
    return false;
  }

  setThisState(){
    this._durationFormatted = this._songTimeHelper.durationFormatted();
    this._percentDone = this._songTimeHelper.percentPlayed();
    this._timeToFinishFormatted = this._songTimeHelper.timeToFinishFormatted();
  }

  checkSongFinished(){
    if (this._songTimeHelper.timeLeft().inSeconds <= 0 && this._delayFetchFlag){
      this._delayFetchTimer = this._createDelayFetchTimer();
      this._delayFetchFlag = false;
      return true;
    }
    return false;
  }

  _createDelayFetchTimer(){
    return Timer.periodic (Duration(milliseconds: 5000), (Timer t) {
      this._delayFetchFlag = true;
      this._delayFetchTimer.cancel();
    });
  }

  _cancelTimers(){
    this._timer.cancel();
    if (_delayFetchTimer != null) {
      _delayFetchTimer.cancel();
    }
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
}
