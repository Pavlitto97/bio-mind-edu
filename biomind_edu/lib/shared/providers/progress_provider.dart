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

/// Provider для получения всех записей прогресса
final allProgressProvider = FutureProvider<List<LessonProgress>>((ref) async {
  final storage = LocalStorageService();
  return storage.getAllProgress();
});

/// Provider для получения прогресса конкретного урока
final lessonProgressProvider = FutureProvider.family<LessonProgress?, String>((ref, lessonId) async {
  final storage = LocalStorageService();
  return storage.getProgress(lessonId);
});

/// Provider для получения всех наград пользователя
final allRewardsProvider = FutureProvider<List<Reward>>((ref) async {
  final storage = LocalStorageService();
  return storage.getAllRewards();
});

/// Provider для получения разблокированных наград
final unlockedRewardsProvider = FutureProvider<List<Reward>>((ref) async {
  final allRewards = await ref.watch(allRewardsProvider.future);
  return allRewards.where((r) => r.isUnlocked).toList();
});

/// Provider для получения профиля пользователя
final userProfileProvider = FutureProvider<UserProfile?>((ref) async {
  final storage = LocalStorageService();
  return storage.getUserProfile();
});

/// StateNotifier для управления профилем
class UserProfileNotifier extends StateNotifier<UserProfile?> {
  final LocalStorageService _storage;
  
  UserProfileNotifier(this._storage) : super(null) {
    _loadProfile();
  }
  
  Future<void> _loadProfile() async {
    state = _storage.getUserProfile();
  }
  
  Future<void> updateProfile(UserProfile profile) async {
    await _storage.saveUserProfile(profile);
    state = profile;
  }
  
  Future<void> updatePreference(String key, dynamic value) async {
    if (state == null) return;
    
    final updatedPreferences = {...state!.preferences, key: value};
    final updatedProfile = state!.copyWith(preferences: updatedPreferences);
    await updateProfile(updatedProfile);
  }
}

/// Provider для управления профилем пользователя
final userProfileNotifierProvider = StateNotifierProvider<UserProfileNotifier, UserProfile?>((ref) {
  return UserProfileNotifier(LocalStorageService());
});

/// Provider для статистики прогресса (using ProgressService)
final progressStatisticsProvider = FutureProvider<ProgressStatistics>((ref) async {
  final progressService = ref.watch(progressServiceProvider);
  return progressService.getOverallProgress();
});

/// Provider для истории уроков
final lessonHistoryProvider = FutureProvider<List<LessonProgressHistory>>((ref) async {
  final progressService = ref.watch(progressServiceProvider);
  return progressService.getLessonHistory(limit: 10);
});

/// Provider для результатов тестов
final testResultsProvider = FutureProvider<List<TestResult>>((ref) async {
  final progressService = ref.watch(progressServiceProvider);
  return progressService.getTestResults();
});
