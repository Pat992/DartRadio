class Song {
  int _id;
  String _title;
  String _album;
  String _artist;
  DateTime _startedAt;
  DateTime _endsAt;

  Song.fromJson(Map<String, dynamic> jsonData) {
    _id = jsonData['id'];
    _title = jsonData['title'];
    _album = jsonData['album'];
    _artist = jsonData['artist']['name'];
    _startedAt = jsonData['started_at'];
    _endsAt = jsonData['ends_at'];
  }

  get id {
    return _id;
  }

  get title {
    return _title;
  }

  get album {
    return _album;
  }

  get artist {
    return _artist;
  }

  get startedAt {
    return _startedAt;
  }

  get endsAt {
    return _endsAt;
  }
}
