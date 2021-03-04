import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';

class PlayerProvider with ChangeNotifier {
  AudioPlayer _player;
  bool _isPlaying = false;

  PlayerProvider() {
    _player = AudioPlayer();
  }

  Future<void> play(String songUrl) async {
    _player.stop();
    await _player.setUrl(songUrl);
    _player.play();
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
