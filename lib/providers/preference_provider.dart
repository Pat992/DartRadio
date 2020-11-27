import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceProvider with ChangeNotifier {
  SharedPreferences _prefs;
  bool _isDarkTheme;
  List<String> _favorites;

  Future<void> initPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    // _isDarkTheme = _prefs.getBool('isDarkTheme');
    // _favorites = _prefs.getStringList('favorites');
  }

  get isDarkTheme {
    try {
      return _prefs.getBool('isDarkTheme') ?? false;
    } catch (e) {
      return false;
    }
  }

  get favorites {
    try {
      return _prefs.getStringList('favorites') ?? [];
    } catch (e) {
      return [];
    }
  }

  Future<void> setDarkTheme(bool themeSetting) async {
    _isDarkTheme = themeSetting;
    await _prefs.setBool('isDarkTheme', _isDarkTheme);
    notifyListeners();
  }

  Future<void> toggleFavorites(String stationName) async {
    _favorites.contains(stationName) ? _favorites.remove(stationName) : _favorites.add(stationName);
    await _prefs.setStringList('favorites', _favorites);
    notifyListeners();
  }

}
