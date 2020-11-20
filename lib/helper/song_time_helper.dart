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

  Duration timeToFinish(){
    return new DateTime.now().difference(_startdate);
  }

  Duration timeLeft(){
    return _enddate.difference(new DateTime.now());
  }

  int minutesToFinish(){
    return timeToFinish().inMinutes;
  }

  int secondsToFinish(){
    return timeToFinish().inSeconds - (timeToFinish().inMinutes * 60);
  }

  int minutesLeft(){
    return timeLeft().inMinutes;
  }

  int secondsLeft(){
    return timeLeft().inSeconds - (timeLeft().inMinutes * 60);
  }

  int percentPlayed(){
    return (timeToFinish().inSeconds * 100 / duration.inSeconds).round();
  }

  String durationFormatted(){
    return duration.toString();
  }



}
