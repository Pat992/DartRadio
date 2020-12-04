class Genre {
  String _name;

  Genre.fromJson(Map<String, dynamic> jsonData) {
    _name = jsonData['name'];
  }

  Genre(String genre){
    _name = genre;
  }

  get genre {
    return _name;
  }
}
