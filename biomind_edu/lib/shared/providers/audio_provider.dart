import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:biomind_edu/core/services/audio_service.dart';

/// Provider для AudioService
final audioServiceProvider = Provider<AudioService>((ref) {
  return AudioService();
});

/// Audio playback state
class AudioState {
  final bool isVoicePlaying;
  final bool isMusicPlaying;
  final double voiceVolume;
  final double musicVolume;
  final double sfxVolume;
  final bool isMuted;
  
  const AudioState({
    this.isVoicePlaying = false,
    this.isMusicPlaying = false,
    this.voiceVolume = 1.0,
    this.musicVolume = 0.3,
    this.sfxVolume = 0.7,
    this.isMuted = false,
  });
  
  AudioState copyWith({
    bool? isVoicePlaying,
    bool? isMusicPlaying,
    double? voiceVolume,
    double? musicVolume,
    double? sfxVolume,
    bool? isMuted,
  }) {
    return AudioState(
      isVoicePlaying: isVoicePlaying ?? this.isVoicePlaying,
      isMusicPlaying: isMusicPlaying ?? this.isMusicPlaying,
      voiceVolume: voiceVolume ?? this.voiceVolume,
      musicVolume: musicVolume ?? this.musicVolume,
      sfxVolume: sfxVolume ?? this.sfxVolume,
      isMuted: isMuted ?? this.isMuted,
    );
  }
}

/// StateNotifier для управления аудио
class AudioNotifier extends StateNotifier<AudioState> {
  final AudioService _audioService;
  
  AudioNotifier(this._audioService) : super(const AudioState()) {
    _initializeVolumes();
  }
  
  void _initializeVolumes() {
    _audioService.setVoiceVolume(state.voiceVolume);
    _audioService.setMusicVolume(state.musicVolume);
    _audioService.setSfxVolume(state.sfxVolume);
  }
  
  Future<void> playVoice(String fileName, {String? locale}) async {
    if (state.isMuted) return;
    
    state = state.copyWith(isVoicePlaying: true);
    await _audioService.playVoice(fileName, locale: locale);
    state = state.copyWith(isVoicePlaying: false);
  }
  
  Future<void> playSfx(String fileName) async {
    if (state.isMuted) return;
    await _audioService.playSfx(fileName);
  }
  
  Future<void> playMusic(String fileName) async {
    if (state.isMuted) return;
    
    state = state.copyWith(isMusicPlaying: true);
    await _audioService.playMusic(fileName);
  }
  
  Future<void> stopVoice() async {
    await _audioService.stopVoice();
    state = state.copyWith(isVoicePlaying: false);
  }
  
  Future<void> stopMusic() async {
    await _audioService.stopMusic();
    state = state.copyWith(isMusicPlaying: false);
  }
  
  Future<void> stopAll() async {
    await _audioService.stopAll();
    state = state.copyWith(
      isVoicePlaying: false,
      isMusicPlaying: false,
    );
  }
  
  void setVoiceVolume(double volume) {
    _audioService.setVoiceVolume(volume);
    state = state.copyWith(voiceVolume: volume);
  }
  
  void setMusicVolume(double volume) {
    _audioService.setMusicVolume(volume);
    state = state.copyWith(musicVolume: volume);
  }
  
  void setSfxVolume(double volume) {
    _audioService.setSfxVolume(volume);
    state = state.copyWith(sfxVolume: volume);
  }
  
  void toggleMute() {
    final newMuted = !state.isMuted;
    if (newMuted) {
      _audioService.mute();
    } else {
      _audioService.unmute();
    }
    state = state.copyWith(isMuted: newMuted);
  }
  
  void setMute(bool muted) {
    if (muted) {
      _audioService.mute();
    } else {
      _audioService.unmute();
    }
    state = state.copyWith(isMuted: muted);
  }
}

/// Provider для управления аудио
final audioNotifierProvider = StateNotifierProvider<AudioNotifier, AudioState>((ref) {
  final audioService = ref.watch(audioServiceProvider);
  return AudioNotifier(audioService);
});

/// Shortcut providers для быстрого доступа
final isMutedProvider = Provider<bool>((ref) {
  return ref.watch(audioNotifierProvider).isMuted;
});

final isVoicePlayingProvider = Provider<bool>((ref) {
  return ref.watch(audioNotifierProvider).isVoicePlaying;
});
