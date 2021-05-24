import 'package:audioplayers/audioplayers.dart';
import 'package:tarot_app/enums/music.dart';
import 'package:tarot_app/global/constants.dart';

class MusicService {
  MusicService._privateConstructor();
  static final MusicService instance = MusicService._privateConstructor();
  AudioPlayer player;
  AudioCache cache;

  Music musicFile = Music.off;

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
    musicFile = Music.epic;
    player.stop();
    player = await cache.loop('epic_option_1.mp3');
  }

  void stopMusic() async {
    musicFile = Music.off;
    player.stop();
  }

  void playMeditativeMusic() async {
    musicFile = Music.meditative;
    player.stop();
    player = await cache.loop('relaxing.mp3');
  }

  void playRelaxingMusic() async {
    musicFile = Music.relaxing;
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
