import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter/foundation.dart';

/// Text-to-Speech service for voicing lesson content
///
/// Provides narration for:
/// - Lesson introductions
/// - Element descriptions (when clicked)
/// - Instructions and hints
/// - Game feedback
class TtsService {
  static final TtsService _instance = TtsService._internal();
  factory TtsService() => _instance;
  TtsService._internal();

  final FlutterTts _flutterTts = FlutterTts();
  bool _isInitialized = false;
  bool _isSpeaking = false;
  String _currentLanguage = 'en';

  /// Initialize TTS with default settings
  Future<void> initialize({String language = 'en'}) async {
    if (_isInitialized) return;

    try {
      // Set language
      _currentLanguage = language;
      await _flutterTts.setLanguage(language == 'uk' ? 'uk-UA' : 'en-US');

      // Configure TTS settings for children
      await _flutterTts.setSpeechRate(0.45); // Slower for kids to understand
      await _flutterTts.setVolume(1.0);
      await _flutterTts.setPitch(1.1); // Slightly higher pitch for friendliness

      // iOS specific settings
      if (defaultTargetPlatform == TargetPlatform.iOS) {
        await _flutterTts.setSharedInstance(true);
        await _flutterTts.setIosAudioCategory(
          IosTextToSpeechAudioCategory.playback,
          [
            IosTextToSpeechAudioCategoryOptions.allowBluetooth,
            IosTextToSpeechAudioCategoryOptions.allowBluetoothA2DP,
            IosTextToSpeechAudioCategoryOptions.mixWithOthers,
          ],
          IosTextToSpeechAudioMode.voicePrompt,
        );
      }

      // Setup handlers
      _flutterTts.setStartHandler(() {
        _isSpeaking = true;
      });

      _flutterTts.setCompletionHandler(() {
        _isSpeaking = false;
      });

      _flutterTts.setErrorHandler((msg) {
        debugPrint('TTS Error: $msg');
        _isSpeaking = false;
      });

      _isInitialized = true;
      debugPrint('TTS Service initialized successfully');
    } catch (e) {
      debugPrint('Failed to initialize TTS: $e');
      throw Exception('TTS initialization failed: $e');
    }
  }

  /// Speak text with optional language override
  Future<void> speak(String text, {String? language}) async {
    if (!_isInitialized) {
      await initialize(language: language ?? _currentLanguage);
    }

    // Stop any current speech
    await stop();

    try {
      // Change language if different
      if (language != null && language != _currentLanguage) {
        _currentLanguage = language;
        await _flutterTts.setLanguage(language == 'uk' ? 'uk-UA' : 'en-US');
      }

      await _flutterTts.speak(text);
    } catch (e) {
      debugPrint('TTS speak error: $e');
    }
  }

  /// Stop current speech
  Future<void> stop() async {
    if (_isSpeaking) {
      await _flutterTts.stop();
      _isSpeaking = false;
    }
  }

  /// Pause speech
  Future<void> pause() async {
    if (_isSpeaking) {
      await _flutterTts.pause();
    }
  }

  /// Check if currently speaking
  bool get isSpeaking => _isSpeaking;

  /// Change language
  Future<void> setLanguage(String language) async {
    _currentLanguage = language;
    await _flutterTts.setLanguage(language == 'uk' ? 'uk-UA' : 'en-US');
  }

  /// Set speech rate (0.0 - 1.0)
  Future<void> setSpeechRate(double rate) async {
    await _flutterTts.setSpeechRate(rate.clamp(0.0, 1.0));
  }

  /// Set volume (0.0 - 1.0)
  Future<void> setVolume(double volume) async {
    await _flutterTts.setVolume(volume.clamp(0.0, 1.0));
  }

  /// Set pitch (0.5 - 2.0)
  Future<void> setPitch(double pitch) async {
    await _flutterTts.setPitch(pitch.clamp(0.5, 2.0));
  }

  /// Get available languages
  Future<List<dynamic>> getLanguages() async {
    final languages = await _flutterTts.getLanguages;
    return languages is List ? languages : [];
  }

  /// Get available voices
  Future<List<dynamic>> getVoices() async {
    final voices = await _flutterTts.getVoices;
    return voices is List ? voices : [];
  }

  /// Dispose TTS resources
  void dispose() {
    _flutterTts.stop();
    _isInitialized = false;
  }
}
