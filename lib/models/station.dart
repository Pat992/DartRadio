class Station {
  String _name;
  String _displayName;
  String _streamUrl;
  String _description;
  List<String> _genres;
  String _image;
  String _songUrl;

  Station.fromJson(Map<String, dynamic> jsonData) {
    _name = jsonData['name'];
    _displayName = jsonData['display_name'];
    _streamUrl = jsonData['stream_url'];
    _description = jsonData['description'];
    _genres = jsonData['genres'];
    _image = jsonData['images']['station'];
    _songUrl = jsonData['api_urls']['current_song'];
  }

  get name {
    return _name;
  }

  get displayName {
    return _displayName;
  }

  get streamUrl {
    return _streamUrl;
  }

  get description {
    return _description;
  }

  get genres {
    return _genres;
  }

  get image {
    return _image;
  }

  get songUrl {
    return _songUrl;
  }
}
