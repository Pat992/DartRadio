import 'package:dart_radio/helper/song_time_helper.dart';
import 'package:dart_radio/models/song.dart';
import 'package:flutter/foundation.dart';

class SongProvider with ChangeNotifier {

  DateTime TEST_START = DateTime.now().subtract(new Duration(seconds: 52));
  DateTime TEST_END = DateTime.now().add(new Duration(seconds: 111));

  Song _song;
  SongTimeHelper _songTimeHelper;

  SongProvider(){
    this._songTimeHelper = new SongTimeHelper(TEST_START, TEST_END);
  }

  get song{
    return _song;
  }

  set song(Song value){
    this._song = value;
    // this._songTimeHelper = new SongTimeHelper(value.startedAt, value.endsAt);
    this._songTimeHelper = new SongTimeHelper(TEST_START, TEST_END);
  }

  getTimeToFinishFormatted(){
    return this._songTimeHelper.timeToFinishFormatted();
  }

  getpercentDone(){
    return this._songTimeHelper.percentPlayed();
  }

  getDurationFormatted(){
    return this._songTimeHelper.durationFormatted();
  }

  // Timer.periodic (Duration(milliseconds: 300), (Timer t) {
  // setState( () {
  // percentDone = widget.songTime.percentPlayed();
  // });
  // });

}
