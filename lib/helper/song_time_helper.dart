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
    return endTime.difference(startTime);
  }

  Duration timeLeft(){
    print(_enddate.difference(new DateTime.now()));
    return _enddate.difference(new DateTime.now());
  }

  int minutesLeft(){
    return timeLeft().inMinutes;
  }

  int secondsLeft(){
    return timeLeft().inSeconds - (timeLeft().inMinutes * 60);
  }

}
