import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:biomind_edu/shared/models/lesson.dart';
import 'package:biomind_edu/core/services/local_storage_service.dart';
import 'package:biomind_edu/shared/data/sample_lesson_data.dart';

/// Provider для LocalStorageService
final localStorageServiceProvider = Provider<LocalStorageService>((ref) {
  return LocalStorageService();
});

/// Provider для получения всех уроков с проверкой unlock статуса
/// WEB MODE: Loading directly from SampleLessonData and checking progress
final lessonsProvider = FutureProvider<List<Lesson>>((ref) async {
  final storage = ref.watch(localStorageServiceProvider);
  final allLessons = SampleLessonData.allLessons;

  // Check each lesson's prerequisites and update lock status
  final updatedLessons = <Lesson>[];

  for (final lesson in allLessons) {
    bool shouldLock = false;

    // Check if all prerequisites are completed
    if (lesson.prerequisites.isNotEmpty) {
      for (final prereqId in lesson.prerequisites) {
        final progress = storage.getProgress(prereqId);
        // Lock if prerequisite is not completed (task not done)
        if (progress == null || !progress.taskCompleted) {
          shouldLock = true;
          break;
        }
      }
    }

    // Create updated lesson with correct lock status
    updatedLessons.add(lesson.copyWith(isLocked: shouldLock));
  }

  return updatedLessons;
});

/// Provider для получения конкретного урока по ID
/// WEB MODE: Loading directly from SampleLessonData instead of Hive storage
final lessonByIdProvider = FutureProvider.family<Lesson?, String>((
  ref,
  lessonId,
) async {
  // For web demo - find in sample data directly
  try {
    return SampleLessonData.allLessons.firstWhere(
      (lesson) => lesson.id == lessonId,
    );
  } catch (e) {
    return null;
  }
});

/// Provider для отслеживания текущего активного урока
final currentLessonProvider = StateProvider<Lesson?>((ref) => null);

/// Provider для состояния AR сессии урока
class LessonSessionState {
  final String lessonId;
  final bool isArInitialized;
  final bool isModelLoaded;
  final String? error;
  final List<String> viewedAnnotations;

  const LessonSessionState({
    required this.lessonId,
    this.isArInitialized = false,
    this.isModelLoaded = false,
    this.error,
    this.viewedAnnotations = const [],
  });

  LessonSessionState copyWith({
    String? lessonId,
    bool? isArInitialized,
    bool? isModelLoaded,
    String? error,
    List<String>? viewedAnnotations,
  }) {
    return LessonSessionState(
      lessonId: lessonId ?? this.lessonId,
      isArInitialized: isArInitialized ?? this.isArInitialized,
      isModelLoaded: isModelLoaded ?? this.isModelLoaded,
      error: error ?? this.error,
      viewedAnnotations: viewedAnnotations ?? this.viewedAnnotations,
    );
  }
}

/// StateNotifier для управления сессией урока
class LessonSessionNotifier extends StateNotifier<LessonSessionState> {
  LessonSessionNotifier(String lessonId)
    : super(LessonSessionState(lessonId: lessonId));

  void setArInitialized(bool value) {
    state = state.copyWith(isArInitialized: value);
  }

  void setModelLoaded(bool value) {
    state = state.copyWith(isModelLoaded: value);
  }

  void setError(String? error) {
    state = state.copyWith(error: error);
  }

  void addViewedAnnotation(String annotationId) {
    final updated = [...state.viewedAnnotations, annotationId];
    state = state.copyWith(viewedAnnotations: updated);
  }

  bool hasViewedAnnotation(String annotationId) {
    return state.viewedAnnotations.contains(annotationId);
  }
}

/// Provider для сессии урока (family - для каждого урока свой)
final lessonSessionProvider =
    StateNotifierProvider.family<
      LessonSessionNotifier,
      LessonSessionState,
      String
    >((ref, lessonId) => LessonSessionNotifier(lessonId));
