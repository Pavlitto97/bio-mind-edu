import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/services/tts_service.dart';
import '../data/lesson_narration_texts.dart';

/// Provider for TTS service instance
final ttsServiceProvider = Provider<TtsService>((ref) {
  return TtsService();
});

/// Provider for TTS state management
final ttsStateProvider = StateNotifierProvider<TtsNotifier, TtsState>((ref) {
  final ttsService = ref.watch(ttsServiceProvider);
  return TtsNotifier(ttsService);
});

/// TTS State
class TtsState {
  final bool isSpeaking;
  final bool isInitialized;
  final String currentLanguage;
  final String? currentText;
  final String? error;

  const TtsState({
    this.isSpeaking = false,
    this.isInitialized = false,
    this.currentLanguage = 'en',
    this.currentText,
    this.error,
  });

  TtsState copyWith({
    bool? isSpeaking,
    bool? isInitialized,
    String? currentLanguage,
    String? currentText,
    String? error,
  }) {
    return TtsState(
      isSpeaking: isSpeaking ?? this.isSpeaking,
      isInitialized: isInitialized ?? this.isInitialized,
      currentLanguage: currentLanguage ?? this.currentLanguage,
      currentText: currentText ?? this.currentText,
      error: error,
    );
  }
}

/// TTS State Notifier
class TtsNotifier extends StateNotifier<TtsState> {
  final TtsService _ttsService;

  TtsNotifier(this._ttsService) : super(const TtsState());

  /// Initialize TTS with language
  Future<void> initialize(String language) async {
    try {
      await _ttsService.initialize(language: language);
      state = state.copyWith(
        isInitialized: true,
        currentLanguage: language,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  /// Speak narration for a lesson element (always in English)
  Future<void> speakNarration({
    required String lessonId,
    required String elementId,
    String? language, // Ignored - always uses English
  }) async {
    const lang = 'en'; // Force English

    // Get narration text
    final text = LessonNarrationTexts.getNarration(
      lessonId: lessonId,
      elementId: elementId,
      language: lang,
    );

    if (text == null) {
      state = state.copyWith(error: 'No narration found for this element');
      return;
    }

    await speak(text, language: lang);
  }

  /// Speak introduction for a lesson (always in English)
  Future<void> speakIntro({
    required String lessonId,
    String? language, // Ignored - always uses English
  }) async {
    await speakNarration(
      lessonId: lessonId,
      elementId: 'intro',
      language: 'en', // Force English
    );
  }

  /// Speak summary for a lesson (always in English)
  Future<void> speakSummary({
    required String lessonId,
    String? language, // Ignored - always uses English
  }) async {
    await speakNarration(
      lessonId: lessonId,
      elementId: 'summary',
      language: 'en', // Force English
    );
  }

  /// Speak any text
  Future<void> speak(String text, {String? language}) async {
    try {
      if (!state.isInitialized) {
        await initialize(language ?? state.currentLanguage);
      }

      state = state.copyWith(
        isSpeaking: true,
        currentText: text,
        error: null,
      );

      await _ttsService.speak(text, language: language ?? state.currentLanguage);

      // Wait a bit and update state
      await Future<void>.delayed(const Duration(milliseconds: 500));
      if (mounted && !_ttsService.isSpeaking) {
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

  /// Change language
  Future<void> setLanguage(String language) async {
    await _ttsService.setLanguage(language);
    state = state.copyWith(currentLanguage: language);
  }

  /// Change speech rate
  Future<void> setSpeechRate(double rate) async {
    await _ttsService.setSpeechRate(rate);
  }

  /// Replay current text
  Future<void> replay() async {
    if (state.currentText != null) {
      await speak(state.currentText!, language: state.currentLanguage);
    }
  }

  @override
  void dispose() {
    _ttsService.dispose();
    super.dispose();
  }
}
