import 'package:dart_radio/models/genre.dart';
import 'package:dart_radio/models/station.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StationsProvider with ChangeNotifier {
  List<Station> _stations;
  List<Station> _favoriteStations;
  List<Genre> _genres;
  String _baseUrl;
  String _stationUrl;
  String _genreUrl;
  Station _currentStation;

  StationsProvider() {
    _baseUrl = 'https://api.laut.fm/';
    _stationUrl = 'stations';
    _genreUrl = 'genres';
    _stations = [];
    _genres = [];
    _currentStation = new Station();
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
    return _stations;
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
