import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';

/// Enhanced TTS Service using Flutter TTS
/// 
/// Professional TTS for child-friendly narration with natural voices
/// Works on all platforms including web
class DeepgramTtsService {
  final FlutterTts _flutterTts = FlutterTts();
  bool _isInitialized = false;
  bool _isSpeaking = false;
  
  /// Initialize the TTS service
  Future<void> initialize() async {
    if (_isInitialized) return;
    
    try {
      // Configure TTS for children
      await _flutterTts.setLanguage("en-US");
      await _flutterTts.setSpeechRate(0.45); // Slow for kids
      await _flutterTts.setVolume(1.0);
      await _flutterTts.setPitch(1.1); // Slightly higher pitch for friendliness
      
      // Set up completion handler
      _flutterTts.setCompletionHandler(() {
        _isSpeaking = false;
      });
      
      // Set up error handler
      _flutterTts.setErrorHandler((msg) {
        debugPrint('❌ TTS error: $msg');
        _isSpeaking = false;
      });
      
      _isInitialized = true;
      debugPrint('✅ TTS initialized successfully');
    } catch (e) {
      debugPrint('❌ Failed to initialize TTS: $e');
      rethrow;
    }
  }
  
  /// Speak text
  Future<void> speak(
    String text, {
    String voice = 'en-US',
    double speed = 0.45,
  }) async {
    if (!_isInitialized) {
      await initialize();
    }
    
    if (_isSpeaking) {
      await stop();
    }
    
    try {
      _isSpeaking = true;
      
      // Clean text from emojis for better TTS
      final cleanText = text.replaceAll(RegExp(r'[^\w\s.,!?\-]'), '');
      
      await _flutterTts.setSpeechRate(speed);
      await _flutterTts.speak(cleanText);
      
      debugPrint('🎙️ Speaking: ${cleanText.substring(0, cleanText.length > 50 ? 50 : cleanText.length)}...');
      
    } catch (e) {
      debugPrint('❌ TTS speak error: $e');
      _isSpeaking = false;
      rethrow;
    }
  }
  
  /// Stop current speech
  Future<void> stop() async {
    if (_isSpeaking) {
      await _flutterTts.stop();
      _isSpeaking = false;
    }
  }
  
  /// Pause current speech
  Future<void> pause() async {
    if (_isSpeaking) {
      await _flutterTts.pause();
    }
  }
  
  /// Check if currently speaking
  bool get isSpeaking => _isSpeaking;
  
  /// Dispose resources
  Future<void> dispose() async {
    await stop();
    _isInitialized = false;
  }
}
