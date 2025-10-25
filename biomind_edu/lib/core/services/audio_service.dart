import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

import '../constants/app_constants.dart';

/// Audio playback state
enum AudioState { stopped, playing, paused, loading, error }

/// Audio Service
///
/// Manages audio playback for voice instructions, sound effects, and music.
/// Supports multiple concurrent audio streams.
class AudioService {
  static final AudioService _instance = AudioService._internal();

  factory AudioService() => _instance;

  AudioService._internal();

  /// Audio player for voice instructions
  final AudioPlayer _voicePlayer = AudioPlayer();

  /// Audio player for sound effects
  final AudioPlayer _sfxPlayer = AudioPlayer();

  /// Audio player for background music
  final AudioPlayer _musicPlayer = AudioPlayer();

  /// Current audio state
  AudioState _voiceState = AudioState.stopped;
  AudioState _sfxState = AudioState.stopped;
  AudioState _musicState = AudioState.stopped;

  /// Current volume settings
  double _voiceVolume = AudioConstants.defaultVolume;
  double _sfxVolume = AudioConstants.defaultVolume;
  double _musicVolume =
      AudioConstants.defaultVolume * 0.5; // Lower for background

  /// Mute state
  bool _isMuted = false;

  /// Audio context initialized (for web browsers autoplay policy)
  bool _audioContextInitialized = false;

  /// Initialize audio service
  Future<void> initialize() async {
    try {
      // Set audio modes
      await _voicePlayer.setReleaseMode(ReleaseMode.stop);
      await _sfxPlayer.setReleaseMode(ReleaseMode.stop);
      await _musicPlayer.setReleaseMode(ReleaseMode.loop);

      // Set initial volumes
      await _voicePlayer.setVolume(_voiceVolume);
      await _sfxPlayer.setVolume(_sfxVolume);
      await _musicPlayer.setVolume(_musicVolume);

      // Listen to state changes
      _voicePlayer.onPlayerStateChanged.listen((state) {
        _voiceState = _mapPlayerState(state);
      });

      _sfxPlayer.onPlayerStateChanged.listen((state) {
        _sfxState = _mapPlayerState(state);
      });

      _musicPlayer.onPlayerStateChanged.listen((state) {
        _musicState = _mapPlayerState(state);
      });
    } catch (e) {
      if (kDebugMode) {
        print('Failed to initialize audio service: $e');
      }
    }
  }

  /// Initialize audio context for web browsers (bypasses autoplay policy)
  /// Should be called after user interaction (button click)
  Future<bool> initializeAudioContext() async {
    if (_audioContextInitialized) {
      return true;
    }

    try {
      // Play a silent sound to initialize audio context
      await _sfxPlayer.setVolume(0.0);
      
      // Try to play a short silent sound
      try {
        await _sfxPlayer.play(AssetSource('audio/background_music_main.mp3'));
        await Future<void>.delayed(const Duration(milliseconds: 100));
        await _sfxPlayer.stop();
      } catch (playError) {
        // If play fails, that's okay - context might still be initialized
        if (kDebugMode) {
          print('⚠️ Silent play failed (expected on some platforms): $playError');
        }
      }
      
      await _sfxPlayer.setVolume(_sfxVolume);

      _audioContextInitialized = true;
      if (kDebugMode) {
        print('✅ Audio context initialized successfully');
      }
      return true;
    } catch (e) {
      if (kDebugMode) {
        print('❌ Failed to initialize audio context: $e');
      }
      // Mark as initialized anyway to prevent repeated attempts
      _audioContextInitialized = true;
      return false;
    }
  }

  /// Check if audio context is initialized
  bool get isAudioContextInitialized => _audioContextInitialized;

  /// Play voice instruction (with background music ducking)
  Future<void> playVoice(String audioFile, {String? locale}) async {
    try {
      await stopVoice();

      // Duck background music to 30% volume
      await _duckBackgroundMusic();

      final String path = _getVoicePath(audioFile, locale);
      await _voicePlayer.play(AssetSource(path));

      // Restore music when voice completes
      _voicePlayer.onPlayerComplete.first.then((_) {
        _restoreBackgroundMusic();
      });
    } catch (e) {
      if (kDebugMode) {
        print('Failed to play voice: $e');
      }
      // Restore music even if voice fails
      await _restoreBackgroundMusic();
    }
  }

  /// Play sound effect (with background music ducking)
  Future<void> playSfx(String audioFile) async {
    try {
      // Duck background music to 30% volume
      await _duckBackgroundMusic();

      final String path = _getSfxPath(audioFile);
      await _sfxPlayer.play(AssetSource(path));

      // Restore music when SFX completes
      _sfxPlayer.onPlayerComplete.first.then((_) {
        _restoreBackgroundMusic();
      });
    } catch (e) {
      if (kDebugMode) {
        print('Failed to play SFX: $e');
      }
      // Restore music even if SFX fails
      await _restoreBackgroundMusic();
    }
  }

  /// Duck background music to 30% volume
  Future<void> _duckBackgroundMusic() async {
    if (_musicState == AudioState.playing && !_isMuted) {
      await _musicPlayer.setVolume(_musicVolume * 0.3);
      if (kDebugMode) {
        print('🔉 Background music ducked to 30%');
      }
    }
  }

  /// Restore background music to original volume
  Future<void> _restoreBackgroundMusic() async {
    if (!_isMuted) {
      await Future<void>.delayed(const Duration(milliseconds: 500));
      await _musicPlayer.setVolume(_musicVolume);
      if (kDebugMode) {
        print('🔊 Background music restored to 100%');
      }
    }
  }

  /// Play background music
  Future<void> playMusic(String audioFile) async {
    try {
      await stopMusic();

      final String path = _getMusicPath(audioFile);
      await _musicPlayer.play(AssetSource(path));
    } catch (e) {
      if (kDebugMode) {
        print('Failed to play music: $e');
      }
    }
  }

  /// Stop voice playback
  Future<void> stopVoice() async {
    await _voicePlayer.stop();
  }

  /// Stop sound effect
  Future<void> stopSfx() async {
    await _sfxPlayer.stop();
  }

  /// Stop music
  Future<void> stopMusic() async {
    await _musicPlayer.stop();
  }

  /// Pause voice playback
  Future<void> pauseVoice() async {
    await _voicePlayer.pause();
  }

  /// Resume voice playback
  Future<void> resumeVoice() async {
    await _voicePlayer.resume();
  }

  /// Set voice volume (0.0 - 1.0)
  Future<void> setVoiceVolume(double volume) async {
    _voiceVolume = volume.clamp(0.0, 1.0);
    if (!_isMuted) {
      await _voicePlayer.setVolume(_voiceVolume);
    }
  }

  /// Set SFX volume (0.0 - 1.0)
  Future<void> setSfxVolume(double volume) async {
    _sfxVolume = volume.clamp(0.0, 1.0);
    if (!_isMuted) {
      await _sfxPlayer.setVolume(_sfxVolume);
    }
  }

  /// Set music volume (0.0 - 1.0)
  Future<void> setMusicVolume(double volume) async {
    _musicVolume = volume.clamp(0.0, 1.0);
    if (!_isMuted) {
      await _musicPlayer.setVolume(_musicVolume);
    }
  }

  /// Mute all audio
  Future<void> mute() async {
    _isMuted = true;
    await _voicePlayer.setVolume(0.0);
    await _sfxPlayer.setVolume(0.0);
    await _musicPlayer.setVolume(0.0);
  }

  /// Unmute all audio
  Future<void> unmute() async {
    _isMuted = false;
    await _voicePlayer.setVolume(_voiceVolume);
    await _sfxPlayer.setVolume(_sfxVolume);
    await _musicPlayer.setVolume(_musicVolume);
  }

  /// Toggle mute
  Future<void> toggleMute() async {
    if (_isMuted) {
      await unmute();
    } else {
      await mute();
    }
  }

  /// Stop all audio
  Future<void> stopAll() async {
    await stopVoice();
    await stopSfx();
    await stopMusic();
  }

  /// Get voice audio state
  AudioState get voiceState => _voiceState;

  /// Get SFX audio state
  AudioState get sfxState => _sfxState;

  /// Get music audio state
  AudioState get musicState => _musicState;

  /// Check if voice is playing
  bool get isVoicePlaying => _voiceState == AudioState.playing;

  /// Check if any audio is playing
  bool get isAnyPlaying =>
      _voiceState == AudioState.playing ||
      _sfxState == AudioState.playing ||
      _musicState == AudioState.playing;

  /// Get voice path with locale
  String _getVoicePath(String audioFile, String? locale) {
    final String lang = locale ?? LocaleConstants.defaultLocale;
    return '${AudioConstants.audioPath}${AudioConstants.voiceInstructions}$lang/$audioFile';
  }

  /// Get SFX path
  String _getSfxPath(String audioFile) {
    // For now, use simple path directly from assets/audio/
    return 'audio/$audioFile';
  }

  /// Get music path
  String _getMusicPath(String audioFile) {
    // For now, use simple path directly from assets/audio/
    return 'audio/$audioFile';
  }

  /// Map PlayerState to AudioState
  AudioState _mapPlayerState(PlayerState state) {
    switch (state) {
      case PlayerState.playing:
        return AudioState.playing;
      case PlayerState.paused:
        return AudioState.paused;
      case PlayerState.stopped:
        return AudioState.stopped;
      case PlayerState.completed:
        return AudioState.stopped;
      default:
        return AudioState.stopped;
    }
  }

  /// Dispose resources
  Future<void> dispose() async {
    await stopAll();
    await _voicePlayer.dispose();
    await _sfxPlayer.dispose();
    await _musicPlayer.dispose();
  }
}
