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
