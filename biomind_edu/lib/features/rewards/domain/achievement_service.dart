import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/reward_model.dart';
import '../data/mock_rewards_data.dart';
import 'reward_service.dart';
import '../../../core/services/local_storage_service.dart';

/// Provider for AchievementService
final achievementServiceProvider = Provider<AchievementService>((ref) {
  final rewardService = ref.watch(rewardServiceProvider);
  return AchievementService(
    rewardService: rewardService,
    storage: LocalStorageService(),
    ref: ref,
  );
});

/// Achievement Service
///
/// Handles checking and unlocking achievements based on user performance.
/// Tracks speed, accuracy, and other performance metrics.
class AchievementService {
  final RewardService _rewardService;
  final LocalStorageService _storage;
  final Ref _ref;

  AchievementService({
    required RewardService rewardService,
    required LocalStorageService storage,
    required Ref ref,
  }) : _rewardService = rewardService,
       _storage = storage,
       _ref = ref;

  /// Check and unlock speed-based achievements
  ///
  /// Parameters:
  /// - [timeSpentSeconds]: Time taken to complete the task
  /// - [hasErrors]: Whether user made any mistakes
  /// - [accuracyPercent]: Task accuracy percentage (0-100)
  ///
  /// Returns: List of newly unlocked achievement rewards
  Future<List<Reward>> checkSpeedAchievements({
    required int timeSpentSeconds,
    required bool hasErrors,
    required double accuracyPercent,
  }) async {
    final newlyUnlocked = <Reward>[];

    try {
      // Get all achievements from mock data
      final allRewards = mockRewards;
      final unlockedRewards = _rewardService.getUnlockedRewards();
      final unlockedIds = unlockedRewards.map((r) => r.id).toSet();

      // Speed achievements
      if (timeSpentSeconds <= 15 &&
          !unlockedIds.contains('reward_sonic_speed')) {
        final reward = allRewards.firstWhere(
          (r) => r.id == 'reward_sonic_speed',
        );
        final unlocked = await _rewardService.unlockReward(reward.id);
        if (unlocked) {
          newlyUnlocked.add(
            reward.copyWith(isUnlocked: true, unlockedAt: DateTime.now()),
          );
          debugPrint('🏆 Unlocked: Sonic Speed (${timeSpentSeconds}s)');
          // Refresh rewards provider
          _ref.read(rewardsNotifierProvider.notifier).refresh();
        }
      } else if (timeSpentSeconds <= 20 &&
          !unlockedIds.contains('reward_lightning_fast')) {
        final reward = allRewards.firstWhere(
          (r) => r.id == 'reward_lightning_fast',
        );
        final unlocked = await _rewardService.unlockReward(reward.id);
        if (unlocked) {
          newlyUnlocked.add(
            reward.copyWith(isUnlocked: true, unlockedAt: DateTime.now()),
          );
          debugPrint('🏆 Unlocked: Lightning Fast (${timeSpentSeconds}s)');
          // Refresh rewards provider
          _ref.read(rewardsNotifierProvider.notifier).refresh();
        }
      } else if (timeSpentSeconds <= 30 &&
          !unlockedIds.contains('reward_speed_demon')) {
        final reward = allRewards.firstWhere(
          (r) => r.id == 'reward_speed_demon',
        );
        final unlocked = await _rewardService.unlockReward(reward.id);
        if (unlocked) {
          newlyUnlocked.add(
            reward.copyWith(isUnlocked: true, unlockedAt: DateTime.now()),
          );
          debugPrint('🏆 Unlocked: Speed Demon (${timeSpentSeconds}s)');
          // Refresh rewards provider
          _ref.read(rewardsNotifierProvider.notifier).refresh();
        }
      }

      // First Try Master - no errors
      if (!hasErrors &&
          accuracyPercent == 100 &&
          !unlockedIds.contains('reward_first_try_master')) {
        final reward = allRewards.firstWhere(
          (r) => r.id == 'reward_first_try_master',
        );
        final unlocked = await _rewardService.unlockReward(reward.id);
        if (unlocked) {
          newlyUnlocked.add(
            reward.copyWith(isUnlocked: true, unlockedAt: DateTime.now()),
          );
          debugPrint('🏆 Unlocked: First Try Master');
          // Refresh rewards provider
          _ref.read(rewardsNotifierProvider.notifier).refresh();
        }
      }

      // Perfect Combo - speed + accuracy
      if (timeSpentSeconds <= 20 &&
          accuracyPercent == 100 &&
          !hasErrors &&
          !unlockedIds.contains('reward_perfect_combo')) {
        final reward = allRewards.firstWhere(
          (r) => r.id == 'reward_perfect_combo',
        );
        final unlocked = await _rewardService.unlockReward(reward.id);
        if (unlocked) {
          newlyUnlocked.add(
            reward.copyWith(isUnlocked: true, unlockedAt: DateTime.now()),
          );
          debugPrint('🏆 Unlocked: Perfect Combo');
          // Refresh rewards provider
          _ref.read(rewardsNotifierProvider.notifier).refresh();
        }
      }

      return newlyUnlocked;
    } catch (e, stackTrace) {
      debugPrint('❌ Error checking speed achievements: $e');
      debugPrint(stackTrace.toString());
      return [];
    }
  }

  /// Check and unlock lesson completion achievements
  Future<List<Reward>> checkCompletionAchievements() async {
    final newlyUnlocked = <Reward>[];

    try {
      final allRewards = mockRewards;
      final unlockedRewards = _rewardService.getUnlockedRewards();
      final unlockedIds = unlockedRewards.map((r) => r.id).toSet();
      final allProgress = _storage.getAllProgress();

      // First Steps - first lesson started
      if (allProgress.isNotEmpty &&
          !unlockedIds.contains('reward_first_steps')) {
        final reward = allRewards.firstWhere(
          (r) => r.id == 'reward_first_steps',
        );
        final unlocked = await _rewardService.unlockReward(reward.id);
        if (unlocked) {
          newlyUnlocked.add(
            reward.copyWith(isUnlocked: true, unlockedAt: DateTime.now()),
          );
          debugPrint('🏆 Unlocked: First Steps');
          // Refresh rewards provider
          _ref.read(rewardsNotifierProvider.notifier).refresh();
        }
      }

      // Quick Learner - 3 lessons completed in a row
      final completedCount = allProgress
          .where((p) => p.status == 'completed')
          .length;
      if (completedCount >= 3 &&
          !unlockedIds.contains('reward_quick_learner')) {
        final reward = allRewards.firstWhere(
          (r) => r.id == 'reward_quick_learner',
        );
        final unlocked = await _rewardService.unlockReward(reward.id);
        if (unlocked) {
          newlyUnlocked.add(
            reward.copyWith(isUnlocked: true, unlockedAt: DateTime.now()),
          );
          debugPrint('🏆 Unlocked: Quick Learner');
          // Refresh rewards provider
          _ref.read(rewardsNotifierProvider.notifier).refresh();
        }
      }

      // Young Scientist - all badges unlocked
      final badges = unlockedRewards
          .where((r) => r.category == RewardCategory.badge)
          .length;
      if (badges >= 3 && !unlockedIds.contains('reward_scientist')) {
        final reward = allRewards.firstWhere((r) => r.id == 'reward_scientist');
        final unlocked = await _rewardService.unlockReward(reward.id);
        if (unlocked) {
          newlyUnlocked.add(
            reward.copyWith(isUnlocked: true, unlockedAt: DateTime.now()),
          );
          debugPrint('🏆 Unlocked: Young Scientist');
          // Refresh rewards provider
          _ref.read(rewardsNotifierProvider.notifier).refresh();
        }
      }

      // Perfect Score - 100% on any test
      final perfectScores = allProgress
          .where((p) => p.testScore != null && p.testScore == 100.0)
          .toList();
      if (perfectScores.isNotEmpty &&
          !unlockedIds.contains('reward_perfect_score')) {
        final reward = allRewards.firstWhere(
          (r) => r.id == 'reward_perfect_score',
        );
        final unlocked = await _rewardService.unlockReward(reward.id);
        if (unlocked) {
          newlyUnlocked.add(
            reward.copyWith(isUnlocked: true, unlockedAt: DateTime.now()),
          );
          debugPrint('🏆 Unlocked: Perfect Score');
          // Refresh rewards provider
          _ref.read(rewardsNotifierProvider.notifier).refresh();
        }
      }

      return newlyUnlocked;
    } catch (e, stackTrace) {
      debugPrint('❌ Error checking completion achievements: $e');
      debugPrint(stackTrace.toString());
      return [];
    }
  }

  /// Get all unlocked achievements
  List<Reward> getUnlockedAchievements() {
    final allRewards = _rewardService.getAllRewards();
    return allRewards
        .where((r) => r.isUnlocked && r.category == RewardCategory.achievement)
        .toList();
  }

  /// Get achievement progress statistics
  Future<AchievementStats> getAchievementStats() async {
    try {
      final allRewards = mockRewards;
      final unlockedRewards = _rewardService.getUnlockedRewards();

      final totalAchievements = allRewards
          .where((r) => r.category == RewardCategory.achievement)
          .length;

      final unlockedAchievements = unlockedRewards
          .where(
            (r) => r.isUnlocked && r.category == RewardCategory.achievement,
          )
          .length;

      final speedAchievements = unlockedRewards
          .where(
            (r) =>
                r.isUnlocked &&
                (r.id.contains('speed') ||
                    r.id.contains('first_try') ||
                    r.id.contains('combo')),
          )
          .length;

      return AchievementStats(
        totalAchievements: totalAchievements,
        unlockedAchievements: unlockedAchievements,
        speedAchievements: speedAchievements,
        completionPercent: totalAchievements > 0
            ? (unlockedAchievements / totalAchievements) * 100
            : 0,
      );
    } catch (e) {
      debugPrint('❌ Error getting achievement stats: $e');
      return const AchievementStats(
        totalAchievements: 0,
        unlockedAchievements: 0,
        speedAchievements: 0,
        completionPercent: 0,
      );
    }
  }
}

/// Achievement statistics
class AchievementStats {
  final int totalAchievements;
  final int unlockedAchievements;
  final int speedAchievements;
  final double completionPercent;

  const AchievementStats({
    required this.totalAchievements,
    required this.unlockedAchievements,
    required this.speedAchievements,
    required this.completionPercent,
  });
}
