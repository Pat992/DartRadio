import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper {
  SharedPreferences _prefs;
  bool _isDarkTheme;
  List<String> _favorites;

  initPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    _isDarkTheme = _prefs.getBool('isDarkTheme');
    _favorites = _prefs.getStringList('favorites');
  }

  get isDarkTheme {
    return _isDarkTheme;
  }

  get favorites {
    return _favorites;
  }

  Future<void> setDarkTheme(bool themeSetting) async {
    _isDarkTheme = themeSetting;
    await _prefs.setBool('isDarkTheme', _isDarkTheme);
  }

  Future<void> setFavorite(List<String> stations) async {
    _favorites = stations;
    await _prefs.setStringList('favorites', _favorites);
  }
}
