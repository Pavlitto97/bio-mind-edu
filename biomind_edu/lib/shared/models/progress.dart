import 'package:freezed_annotation/freezed_annotation.dart';

part 'progress.freezed.dart';
part 'progress.g.dart';

/// User progress for a lesson
@freezed
class LessonProgress with _$LessonProgress {
  const factory LessonProgress({
    /// User ID (optional for local storage)
    String? userId,

    /// Lesson ID
    required String lessonId,

    /// Current lesson status
    required String status, // 'not_started', 'in_progress', 'completed'
    /// Last accessed timestamp
    DateTime? lastAccessedAt,

    /// Completion timestamp
    DateTime? completedAt,

    /// Interactive task completed
    @Default(false) bool taskCompleted,

    /// Assessment test completed
    @Default(false) bool testCompleted,

    /// Test score (0.0 - 1.0)
    double? testScore,

    /// Time spent in seconds
    @Default(0) int timeSpentSeconds,

    /// Number of attempts
    @Default(0) int attempts,
  }) = _LessonProgress;

  factory LessonProgress.fromJson(Map<String, dynamic> json) =>
      _$LessonProgressFromJson(json);
}

/// Reward entity
@freezed
class Reward with _$Reward {
  const factory Reward({
    /// Reward ID
    required String id,

    /// Reward name (localized key)
    required String nameKey,

    /// Reward description (localized key)
    required String descriptionKey,

    /// Reward image path
    required String imagePath,

    /// Reward type (sticker, badge, certificate)
    @Default('sticker') String type,

    /// Unlock condition (lesson completion, test score, etc)
    required String unlockCondition,

    /// Is unlocked
    @Default(false) bool isUnlocked,

    /// Unlock timestamp
    DateTime? unlockedAt,

    /// Rarity (common, rare, epic, legendary)
    @Default('common') String rarity,
  }) = _Reward;

  factory Reward.fromJson(Map<String, dynamic> json) => _$RewardFromJson(json);
}

/// User profile
@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    /// User ID
    required String id,

    /// Display name
    String? displayName,

    /// Age
    int? age,

    /// Preferred language
    @Default('en') String language,

    /// Avatar image path
    String? avatarPath,

    /// Total lessons completed
    @Default(0) int lessonsCompleted,

    /// Total rewards unlocked
    @Default(0) int rewardsUnlocked,

    /// Total time spent (seconds)
    @Default(0) int totalTimeSpent,

    /// Registration date
    required DateTime createdAt,

    /// Last active timestamp
    DateTime? lastActiveAt,

    /// Preferences
    @Default({}) Map<String, dynamic> preferences,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
