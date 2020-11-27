import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

class PlayerProvider with ChangeNotifier {
  AudioPlayer _player;
  bool _isPlaying = false;

  PlayerProvider() {
    _player = AudioPlayer();
  }

  Future<void> play(String songUrl) async {
    _player.stop();
    await _player.play(songUrl);
    _isPlaying = true;
    notifyListeners();
  }

  stop() {
    _player.stop();
    _isPlaying = false;
    notifyListeners();
  }

  get isPlaying {
    return _isPlaying;
  }
}
