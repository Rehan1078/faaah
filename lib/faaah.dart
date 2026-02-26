
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

/// A utility class for playing the "FAAAAH" meme sound.
class Faaah {
  static final AudioPlayer _player = AudioPlayer();

  /// Plays the "FAAAAH" meme sound once.
  /// 
  /// The sound file is located in the package's assets directory.
  static Future<void> play() async {
    try {
      // In a Flutter package, assets must be accessed via 'packages/package_name/'
      await _player.play(AssetSource('packages/faaah/assets/faaah.mp3'));
    } catch (e) {
      debugPrint('Faaah: Error playing sound: $e');
    }
  }

  /// Enables a global listener that plays the "FAAAAH" sound 
  /// whenever a [FlutterError] is caught by the framework.
  /// 
  /// Call this in your `main()` before [runApp].
  static void enableGlobalErrorSound() {
    final originalOnError = FlutterError.onError;
    
    FlutterError.onError = (FlutterErrorDetails details) async {
      // Call the original error handler first (or last, depending on preference)
      if (originalOnError != null) {
        originalOnError(details);
      } else {
        FlutterError.presentError(details);
      }
      
      // Play the sound asynchronously
      await play();
    };
  }
}