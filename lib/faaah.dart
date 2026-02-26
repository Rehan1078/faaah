
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

class Faaah {
  static final AudioPlayer _player = AudioPlayer();

  static Future<void> play() async {
    await _player.play(AssetSource('assets/faaah.mp3'));
  }

  static void enableGlobalErrorSound() {
    FlutterError.onError = (FlutterErrorDetails details) async {
      await play();
      FlutterError.presentError(details);
    };
  }
}