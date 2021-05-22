import 'package:audioplayers/audioplayers.dart';
import 'package:tarot_app/global/constants.dart';

class MusicService {
  MusicService._privateConstructor();
  static final MusicService instance = MusicService._privateConstructor();
  AudioPlayer player;
  AudioCache cache;

  AudioPlayer get audioPlayer {
    if (player != null) return player;

    player = AudioPlayer();
    return player;
  }

  AudioCache get audioCache {
    if (cache != null) return cache;

    cache = AudioCache();
    return cache;
  }

  void playEpicMusic() async {
    player.stop();
    player = await cache.loop('epic_option_1.mp3');
  }

  void stopMusic() async {
    player.stop();
  }

  void playMeditativeMusic() async {
    player.stop();
    player = await cache.loop('relaxing.mp3');
  }

  void playRelaxingMusic() async {
    player.stop();
    player = await cache.loop('atmo.mp3');
  }
}

// class MusicService {
//   AudioPlayer player;
//   AudioCache cache;
//
//   static final MusicService _musicService = MusicService._internal();
//
//   factory MusicService() {
//     _musicService.player = AudioPlayer();
//     _musicService.cache = AudioCache();
//
//     return _musicService;
//   }
//
//   MusicService._internal();
// }
