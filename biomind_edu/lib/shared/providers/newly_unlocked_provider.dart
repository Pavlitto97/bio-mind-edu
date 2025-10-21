import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider to track newly unlocked lessons for highlighting
class NewlyUnlockedNotifier extends StateNotifier<Set<String>> {
  NewlyUnlockedNotifier() : super({});

  /// Mark a lesson as newly unlocked (for highlighting)
  void markAsNewlyUnlocked(String lessonId) {
    state = {...state, lessonId};

    // Auto-remove after 10 seconds
    Future.delayed(const Duration(seconds: 10), () {
      if (mounted) {
        clearLessonHighlight(lessonId);
      }
    });
  }

  /// Clear highlight for a specific lesson
  void clearLessonHighlight(String lessonId) {
    state = state.where((id) => id != lessonId).toSet();
  }

  /// Clear all highlights
  void clearAll() {
    state = {};
  }
}

/// Provider for newly unlocked lessons
final newlyUnlockedProvider =
    StateNotifierProvider<NewlyUnlockedNotifier, Set<String>>((ref) {
      return NewlyUnlockedNotifier();
    });
