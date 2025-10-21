import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/services/deepgram_tts_service.dart';
import '../../../l10n/app_localizations.dart';

/// Provider for Deepgram TTS service instance
final deepgramTtsServiceProvider = Provider<DeepgramTtsService>((ref) {
  return DeepgramTtsService();
});

/// Provider for Deepgram TTS state management
final deepgramTtsStateProvider =
    StateNotifierProvider<DeepgramTtsNotifier, DeepgramTtsState>((ref) {
  final ttsService = ref.watch(deepgramTtsServiceProvider);
  return DeepgramTtsNotifier(ttsService);
});

/// Deepgram TTS State
class DeepgramTtsState {
  final bool isSpeaking;
  final bool isInitialized;
  final String currentVoice;
  final double speechSpeed;
  final String? currentText;
  final String? error;

  const DeepgramTtsState({
    this.isSpeaking = false,
    this.isInitialized = false,
    this.currentVoice = 'aura-luna-en',
    this.speechSpeed = 0.9,
    this.currentText,
    this.error,
  });

  DeepgramTtsState copyWith({
    bool? isSpeaking,
    bool? isInitialized,
    String? currentVoice,
    double? speechSpeed,
    String? currentText,
    String? error,
  }) {
    return DeepgramTtsState(
      isSpeaking: isSpeaking ?? this.isSpeaking,
      isInitialized: isInitialized ?? this.isInitialized,
      currentVoice: currentVoice ?? this.currentVoice,
      speechSpeed: speechSpeed ?? this.speechSpeed,
      currentText: currentText ?? this.currentText,
      error: error,
    );
  }
}

/// Deepgram TTS State Notifier
class DeepgramTtsNotifier extends StateNotifier<DeepgramTtsState> {
  final DeepgramTtsService _ttsService;

  DeepgramTtsNotifier(this._ttsService) : super(const DeepgramTtsState());

  /// Initialize TTS
  Future<void> initialize() async {
    try {
      await _ttsService.initialize();
      state = state.copyWith(
        isInitialized: true,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  /// Speak narration for a lesson element using localization texts
  Future<void> speakNarration({
    required BuildContext context,
    required String lessonId,
    required String elementId,
  }) async {
    final l10n = AppLocalizations.of(context)!;
    
    // Remove 'annotation_' prefix if present
    final cleanElementId = elementId.replaceFirst('annotation_', '');
    
    // Get description text from localization
    String? textToSpeak;
    
    switch (lessonId) {
      case 'lesson_cell':
      case 'cell':
        switch (cleanElementId) {
          case 'nucleus':
            textToSpeak = l10n.lessonsCellPartsNucleusDescription;
            break;
          case 'membrane':
            textToSpeak = l10n.lessonsCellPartsMembraneDescription;
            break;
          case 'mitochondria':
            textToSpeak = l10n.lessonsCellPartsMitochondriaDescription;
            break;
          case 'cytoplasm':
            textToSpeak = l10n.lessonsCellPartsCytoplasmDescription;
            break;
        }
        break;
        
      case 'lesson_plant':
      case 'plant':
        switch (cleanElementId) {
          case 'seed':
            textToSpeak = l10n.lessonsPlantPartsSeedDescription;
            break;
          case 'sprout':
            textToSpeak = l10n.lessonsPlantPartsSproutDescription;
            break;
          case 'growth':
            textToSpeak = l10n.lessonsPlantPartsGrowthDescription;
            break;
          case 'bloom':
            textToSpeak = l10n.lessonsPlantPartsBloomDescription;
            break;
        }
        break;
        
      case 'lesson_heart':
      case 'heart':
        switch (cleanElementId) {
          case 'left_atrium':
            textToSpeak = l10n.lessonsHeartPartsLeftAtriumDescription;
            break;
          case 'left_ventricle':
            textToSpeak = l10n.lessonsHeartPartsLeftVentricleDescription;
            break;
          case 'right_atrium':
            textToSpeak = l10n.lessonsHeartPartsRightAtriumDescription;
            break;
          case 'right_ventricle':
            textToSpeak = l10n.lessonsHeartPartsRightVentricleDescription;
            break;
        }
        break;
    }
    
    if (textToSpeak != null && textToSpeak.isNotEmpty) {
      state = state.copyWith(
        isSpeaking: true,
        currentText: textToSpeak,
        error: null,
      );

      try {
        await _ttsService.speak(textToSpeak);
        state = state.copyWith(isSpeaking: false);
      } catch (e) {
        state = state.copyWith(
          isSpeaking: false,
          error: e.toString(),
        );
      }
    }
  }

  /// Speak intro for a lesson
  Future<void> speakIntro({
    required BuildContext context,
    required String lessonId,
  }) async {
    final l10n = AppLocalizations.of(context)!;
    
    String? text;
    switch (lessonId) {
      case 'cell':
        text = l10n.lessonsCellDescription;
        break;
      case 'plant':
        text = l10n.lessonsPlantDescription;
        break;
      case 'heart':
        text = l10n.lessonsHeartDescription;
        break;
    }
    
    if (text != null) {
      await speak(text);
    }
  }

  /// Speak summary for a lesson
  Future<void> speakSummary({
    required BuildContext context,
    required String lessonId,
  }) async {
    // For now, summary uses same text as intro
    await speakIntro(context: context, lessonId: lessonId);
  }

  /// Speak any text using Deepgram
  Future<void> speak(String text) async {
    try {
      if (!state.isInitialized) {
        await initialize();
      }

      state = state.copyWith(
        isSpeaking: true,
        currentText: text,
        error: null,
      );

      await _ttsService.speak(
        text,
        voice: state.currentVoice,
        speed: state.speechSpeed,
      );

      // Update state after completion
      if (mounted) {
        state = state.copyWith(isSpeaking: false, currentText: null);
      }
    } catch (e) {
      state = state.copyWith(
        isSpeaking: false,
        currentText: null,
        error: e.toString(),
      );
    }
  }

  /// Stop current speech
  Future<void> stop() async {
    await _ttsService.stop();
    state = state.copyWith(isSpeaking: false, currentText: null);
  }

  /// Pause speech
  Future<void> pause() async {
    await _ttsService.pause();
    state = state.copyWith(isSpeaking: false);
  }

  /// Resume speech
  Future<void> resume() async {
    // Flutter TTS doesn't have resume on web, just replay
    if (state.currentText != null) {
      await speak(state.currentText!);
    }
  }

  /// Change voice model
  Future<void> setVoice(String voice) async {
    state = state.copyWith(currentVoice: voice);
  }

  /// Change speech speed
  Future<void> setSpeechSpeed(double speed) async {
    state = state.copyWith(speechSpeed: speed);
  }

  /// Replay current text
  Future<void> replay() async {
    if (state.currentText != null) {
      await speak(state.currentText!);
    }
  }

  @override
  void dispose() {
    _ttsService.dispose();
    super.dispose();
  }
}
