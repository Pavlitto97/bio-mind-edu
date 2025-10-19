import 'package:hive/hive.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/reward_model.dart';
import '../data/mock_rewards_data.dart';
import '../../profile/data/models/user_profile_model.dart';

/// Service for managing rewards
class RewardService {
  // Singleton pattern to avoid multiple Hive box opens on web hot reload
  static final RewardService _instance = RewardService._internal();
  factory RewardService() => _instance;
  RewardService._internal();

  static const String _rewardsBoxName = 'rewards';
  static const String _userProfileBoxName = 'userProfile';

  Box<Reward>? _rewardsBox;
  Box<UserProfile>? _userProfileBox;
  bool _initialized = false;

  /// Initialize the service
  Future<void> initialize() async {
    if (_initialized) return;

    _rewardsBox ??= await Hive.openBox<Reward>(_rewardsBoxName);
    _userProfileBox ??= await Hive.openBox<UserProfile>(_userProfileBoxName);

    // Initialize with mock rewards if empty
    if (_rewardsBox!.isEmpty) {
      for (var reward in mockRewards) {
        await _rewardsBox!.put(reward.id, reward);
      }
    }

    // Initialize default user profile if empty
    if (_userProfileBox!.isEmpty) {
      final defaultProfile = UserProfile(
        id: 'default_user',
        name: 'Young Scientist',
        createdAt: DateTime.now(),
        lastActiveAt: DateTime.now(),
      );
      await _userProfileBox!.put('default_user', defaultProfile);
    }

    _initialized = true;
  }

  /// Get all rewards
  List<Reward> getAllRewards() {
  return _rewardsBox?.values.toList() ?? const [];
  }

  /// Get unlocked rewards
  List<Reward> getUnlockedRewards() {
  return _rewardsBox?.values.where((r) => r.isUnlocked).toList() ?? const [];
  }

  /// Get locked rewards
  List<Reward> getLockedRewards() {
  return _rewardsBox?.values.where((r) => !r.isUnlocked).toList() ?? const [];
  }

  /// Check if a reward is unlocked
  bool isRewardUnlocked(String rewardId) {
    final reward = _rewardsBox?.get(rewardId);
    return reward?.isUnlocked ?? false;
  }

  /// Unlock a reward
  Future<bool> unlockReward(String rewardId) async {
  final reward = _rewardsBox?.get(rewardId);
    if (reward == null) return false;

    if (reward.isUnlocked) {
      return false; // Already unlocked
    }

    // Update reward
    final unlockedReward = reward.copyWith(
      isUnlocked: true,
      unlockedAt: DateTime.now(),
    );
  await _rewardsBox!.put(rewardId, unlockedReward);

    // Update user profile
    await _incrementUserRewards(rewardId);

    return true;
  }

  /// Unlock reward for completing a lesson
  Future<Reward?> unlockLessonReward(String lessonId, double score) async {
    // Get lesson completion reward
    final reward = getRewardByLessonId(lessonId);
    if (reward != null) {
      final unlocked = await unlockReward(reward.id);
      if (unlocked) {
  return _rewardsBox!.get(reward.id);
      }
    }

    // Check for perfect score reward (100%)
    if (score >= 1.0) {
      final perfectReward = getPerfectScoreReward(lessonId);
      if (perfectReward != null) {
        final unlocked = await unlockReward(perfectReward.id);
        if (unlocked) {
          return _rewardsBox!.get(perfectReward.id);
        }
      }
    }

    return null;
  }

  /// Get user profile
  UserProfile? getUserProfile() {
  return _userProfileBox?.get('default_user');
  }

  /// Update user profile with new stats
  Future<void> updateUserStats({
    bool? lessonCompleted,
    bool? testCompleted,
    int? starsEarned,
  }) async {
    final profile = getUserProfile();
    if (profile == null) return;

    final updatedProfile = profile.copyWith(
      totalLessonsCompleted: lessonCompleted == true
          ? profile.totalLessonsCompleted + 1
          : profile.totalLessonsCompleted,
      totalTestsCompleted: testCompleted == true
          ? profile.totalTestsCompleted + 1
          : profile.totalTestsCompleted,
      totalStarsEarned: starsEarned != null
          ? profile.totalStarsEarned + starsEarned
          : profile.totalStarsEarned,
      lastActiveAt: DateTime.now(),
    );

  await _userProfileBox!.put('default_user', updatedProfile);
  }

  /// Internal: Increment user rewards count
  Future<void> _incrementUserRewards(String rewardId) async {
    final profile = getUserProfile();
    if (profile == null) return;

    final updatedIds = [...profile.unlockedRewardIds, rewardId];

    final updatedProfile = profile.copyWith(
      rewardsUnlocked: profile.rewardsUnlocked + 1,
      unlockedRewardIds: updatedIds,
      lastActiveAt: DateTime.now(),
    );

  await _userProfileBox!.put('default_user', updatedProfile);
  }

  /// Get reward by ID
  Reward? getRewardById(String rewardId) {
  return _rewardsBox?.get(rewardId);
  }

  /// Get total rewards count
  int getTotalRewardsCount() {
  return _rewardsBox?.length ?? 0;
  }

  /// Get unlocked rewards count
  int getUnlockedRewardsCount() {
    return getUnlockedRewards().length;
  }

  /// Close the service
  Future<void> close() async {
    await _rewardsBox?.close();
    await _userProfileBox?.close();
    _initialized = false;
  }
}

/// Riverpod provider for RewardService
final rewardServiceProvider = Provider<RewardService>((ref) {
  final service = RewardService();
  // Fire-and-forget initialize; ignore if already initialized
  // Avoids blocking provider reads and prevents duplicate opens on hot reload
  // ignore: discarded_futures
  service.initialize();
  return service;
});

/// Provider for all rewards
final allRewardsProvider = Provider<List<Reward>>((ref) {
  final service = ref.watch(rewardServiceProvider);
  return service.getAllRewards();
});

/// Provider for unlocked rewards
final unlockedRewardsProvider = Provider<List<Reward>>((ref) {
  final service = ref.watch(rewardServiceProvider);
  return service.getUnlockedRewards();
});

/// Provider for user profile
final userProfileProvider = Provider<UserProfile?>((ref) {
  final service = ref.watch(rewardServiceProvider);
  return service.getUserProfile();
});
