import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:biomind_edu/shared/models/progress.dart';
import 'package:biomind_edu/core/services/local_storage_service.dart';
import 'package:biomind_edu/core/services/progress_service.dart';
import 'package:biomind_edu/features/rewards/domain/reward_service.dart';

/// Provider for ProgressService
final progressServiceProvider = Provider<ProgressService>((ref) {
  return ProgressService(
    storage: LocalStorageService(),
    rewardService: ref.watch(rewardServiceProvider),
  );
});

/// StateNotifier for managing lesson progress reactively
class ProgressNotifier extends StateNotifier<List<LessonProgress>> {
  final LocalStorageService _storage;

  ProgressNotifier(this._storage) : super([]) {
    _loadProgress();
  }

  void _loadProgress() {
    state = _storage.getAllProgress();
  }

  void refresh() {
    state = _storage.getAllProgress();
  }
}

/// StateNotifier provider for all progress
final progressNotifierProvider =
    StateNotifierProvider<ProgressNotifier, List<LessonProgress>>((ref) {
      return ProgressNotifier(LocalStorageService());
    });

/// Provider для получения всех записей прогресса
final allProgressProvider = Provider<List<LessonProgress>>((ref) {
  return ref.watch(progressNotifierProvider);
});

/// Provider для получения прогресса конкретного урока
final lessonProgressProvider = Provider.family<LessonProgress?, String>((
  ref,
  lessonId,
) {
  final allProgress = ref.watch(progressNotifierProvider);
  try {
    return allProgress.firstWhere((p) => p.lessonId == lessonId);
  } catch (e) {
    return null;
  }
});

/// Provider для статистики прогресса (using ProgressService)
final progressStatisticsProvider = FutureProvider<ProgressStatistics>((
  ref,
) async {
  final progressService = ref.watch(progressServiceProvider);
  return progressService.getOverallProgress();
});

/// Provider для истории уроков
final lessonHistoryProvider = FutureProvider<List<LessonProgressHistory>>((
  ref,
) async {
  final progressService = ref.watch(progressServiceProvider);
  return progressService.getLessonHistory(limit: 10);
});

/// Provider для результатов тестов
final testResultsProvider = FutureProvider<List<TestResult>>((ref) async {
  final progressService = ref.watch(progressServiceProvider);
  return progressService.getTestResults();
});
