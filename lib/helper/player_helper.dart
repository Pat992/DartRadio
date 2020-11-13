import 'package:audioplayers/audioplayers.dart';

class PlayerHelper {
  AudioPlayer _player;

  PlayerHelper() {
    _player = AudioPlayer();
  }

  play(String songUrl) {
    _player.play(songUrl);
  }

  stop() {
    _player.stop();
  }
}
