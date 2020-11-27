import 'package:dart_radio/models/genre.dart';
import 'package:dart_radio/models/station.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StationsProvider with ChangeNotifier {
  List<Station> _stations;
  List<Station> _filteredStations;
  List<Station> _favoriteStations;
  List<Genre> _genres;
  String _baseUrl;
  String _stationUrl;
  String _genreUrl;
  Station _currentStation;
  bool _isFavorite;

  StationsProvider() {
    _baseUrl = 'https://api.laut.fm/';
    _stationUrl = 'stations';
    _genreUrl = 'genres';
    _stations = [];
    _filteredStations = [];
    _genres = [];
    _currentStation = new Station();
    _isFavorite = false;
  }

  Future<void> getApiInformation() async {
    await getStationsFromApi();
    await getGenresFromApi();
  }

  Future<void> getStationsFromApi() async {
    final String url = '$_baseUrl$_stationUrl';

    try {
      final response = await http.get(url);
      final extractedJson = json.decode(response.body) as List<dynamic>;
      if (extractedJson == null) {
        throw Error();
      }

      extractedJson.forEach((element) {
        final station = Station.fromJson(element);
        _stations.add(station);
      });
      _filteredStations = _stations;
    } catch (e) {
      print(e);
    }
  }

  Future<void> getGenresFromApi() async {
    final String url = '$_baseUrl$_genreUrl';

    try {
      final response = await http.get(url);
      final extractedJson = json.decode(response.body) as List<dynamic>;
      if (extractedJson == null) {
        throw Error();
      }

      extractedJson.forEach((element) {
        final genre = Genre.fromJson(element);
        _genres.add(genre);
      });
    } catch (e) {
      print(e);
    }
  }

  setCurrentStation(Station station) {
    _currentStation = station;
    notifyListeners();
  }

  get stations {
    return _filteredStations; //.length == 0 ? _stations : _filteredStations;
  }

  void getStations({String searchText = ""}) {
    if (searchText.trim().isEmpty || searchText == null) {
      _filteredStations = _stations;
      notifyListeners();
      return;
    }
    List<Station> tempList = [];
    for (int i = 0; i < _stations.length; i++) {
      if (_stations[i].displayName.toLowerCase().contains(searchText.toLowerCase())) {

        tempList.add(_stations[i]);
      }
    }
    _filteredStations = tempList;
    notifyListeners();
}

void toggleFavoriteStations({List<dynamic> favorites}) {
    _isFavorite = !_isFavorite;
    if (_isFavorite){
      List<Station> tempList = [];
      for (int i = 0; i < _stations.length; i++) {
        for (int x = 0; x < favorites.length; x++){
          if (_stations[i].displayName.toLowerCase().contains(favorites)) {
            tempList.add(_stations[i]);
          }
        }
      }
      _filteredStations = tempList;
      print(_filteredStations);
      notifyListeners();
      return;
    }
    _filteredStations = _stations;
    notifyListeners();
}

  get favoriteStations {
    return _favoriteStations;
  }

  get genres {
    return _genres;
  }

  get currentStation {
    return _currentStation;
  }
}