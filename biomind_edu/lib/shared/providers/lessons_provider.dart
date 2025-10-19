import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:biomind_edu/shared/models/lesson.dart';
import 'package:biomind_edu/core/services/local_storage_service.dart';
import 'package:biomind_edu/shared/data/sample_lesson_data.dart';

/// Provider для LocalStorageService
final localStorageServiceProvider = Provider<LocalStorageService>((ref) {
  return LocalStorageService();
});

/// Provider для получения всех уроков
/// WEB MODE: Loading directly from SampleLessonData instead of Hive storage
final lessonsProvider = FutureProvider<List<Lesson>>((ref) async {
  // For web demo - return sample data directly
  return SampleLessonData.allLessons;
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
