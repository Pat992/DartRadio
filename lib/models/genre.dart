class Genre {
  String _name;

  Genre.fromJson(Map<String, dynamic> jsonData) {
    _name = jsonData['name'];
  }

  get genre {
    return _name;
  }
}
