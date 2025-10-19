import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:biomind_edu/shared/models/progress.dart';
import 'package:biomind_edu/core/services/local_storage_service.dart';

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

/// Статистика по всему прогрессу
class ProgressStatistics {
  final int totalLessons;
  final int completedLessons;
  final int inProgressLessons;
  final double averageScore;
  final int totalRewards;
  final Duration totalLearningTime;
  
  const ProgressStatistics({
    required this.totalLessons,
    required this.completedLessons,
    required this.inProgressLessons,
    required this.averageScore,
    required this.totalRewards,
    required this.totalLearningTime,
  });
  
  double get completionPercentage => 
      totalLessons > 0 ? (completedLessons / totalLessons) * 100 : 0;
}

/// Provider для статистики прогресса
final progressStatisticsProvider = FutureProvider<ProgressStatistics>((ref) async {
  final allProgress = await ref.watch(allProgressProvider.future);
  final rewards = await ref.watch(unlockedRewardsProvider.future);
  
  final completed = allProgress.where((p) => p.status == 'completed').toList();
  final inProgress = allProgress.where((p) => p.status == 'in_progress').toList();
  
  // Calculate average score from completed lessons
  double avgScore = 0;
  if (completed.isNotEmpty) {
    final scores = completed.where((p) => p.testScore != null).map((p) => p.testScore!);
    if (scores.isNotEmpty) {
      final totalScore = scores.fold<double>(0, (sum, score) => sum + score);
      avgScore = totalScore / scores.length;
    }
  }
  
  // Calculate total learning time from completed lessons
  Duration totalTime = Duration.zero;
  for (final progress in allProgress) {
    totalTime += Duration(seconds: progress.timeSpentSeconds);
  }
  
  return ProgressStatistics(
    totalLessons: allProgress.length,
    completedLessons: completed.length,
    inProgressLessons: inProgress.length,
    averageScore: avgScore,
    totalRewards: rewards.length,
    totalLearningTime: totalTime,
  );
});
