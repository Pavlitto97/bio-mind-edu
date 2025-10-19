import 'package:flutter/foundation.dart';
import 'package:biomind_edu/core/services/local_storage_service.dart';
import 'package:biomind_edu/features/rewards/domain/reward_service.dart';
import 'package:biomind_edu/shared/models/progress.dart';
import 'package:biomind_edu/shared/models/lesson.dart';

/// Progress Tracking Service
///
/// High-level service that coordinates progress updates across
/// LocalStorageService, RewardService, and UserProfile.
///
/// Responsibilities:
/// - Save lesson and test progress
/// - Update user statistics automatically
/// - Trigger reward unlocks
/// - Provide analytics and history
class ProgressService {
  final LocalStorageService _storage;
  final RewardService _rewardService;

  ProgressService({
    required LocalStorageService storage,
    required RewardService rewardService,
  }) : _storage = storage,
       _rewardService = rewardService;

  // ============ LESSON PROGRESS ============

  /// Update lesson progress after interactive task completion
  ///
  /// Automatically:
  /// - Updates LessonProgress
  /// - Increments UserProfile stats
  /// - Unlocks lesson reward if completed
  Future<void> updateLessonProgress({
    required String lessonId,
    required bool taskCompleted,
    int? timeSpentSeconds,
    int? attempts,
  }) async {
    try {
      // Get existing progress or create new
      var progress = _storage.getProgress(lessonId);

      if (progress == null) {
        progress = LessonProgress(
          lessonId: lessonId,
          status: 'in_progress',
          lastAccessedAt: DateTime.now(),
          taskCompleted: false,
          testCompleted: false,
          timeSpentSeconds: 0,
          attempts: 0,
        );
      }

      // Update progress
      final updatedProgress = progress.copyWith(
        status: taskCompleted && progress.testCompleted
            ? 'completed'
            : 'in_progress',
        lastAccessedAt: DateTime.now(),
        taskCompleted: taskCompleted,
        timeSpentSeconds: progress.timeSpentSeconds + (timeSpentSeconds ?? 0),
        attempts: progress.attempts + (attempts ?? 1),
        completedAt: taskCompleted && progress.testCompleted
            ? DateTime.now()
            : progress.completedAt,
      );

      await _storage.saveProgress(updatedProgress);

      // Update user profile if lesson completed
      if (updatedProgress.status == 'completed') {
        await _updateUserProfileOnCompletion(
          lessonId: lessonId,
          timeSpent: updatedProgress.timeSpentSeconds,
        );
      }

      debugPrint('✅ Lesson progress updated: $lessonId');
    } catch (e, stackTrace) {
      debugPrint('❌ Error updating lesson progress: $e');
      debugPrint(stackTrace.toString());
    }
  }

  /// Update test results and mark lesson as completed if passed
  ///
  /// Automatically:
  /// - Updates test score and stars
  /// - Marks lesson as completed
  /// - Unlocks lesson reward
  /// - Updates user statistics
  Future<void> updateTestScore({
    required String lessonId,
    required double score,
    required int stars,
    int? timeSpentSeconds,
  }) async {
    try {
      // Get existing progress or create new
      var progress = _storage.getProgress(lessonId);

      if (progress == null) {
        progress = LessonProgress(
          lessonId: lessonId,
          status: 'in_progress',
          lastAccessedAt: DateTime.now(),
          taskCompleted: false,
          testCompleted: false,
          timeSpentSeconds: 0,
          attempts: 0,
        );
      }

      // Update progress with test results
      final updatedProgress = progress.copyWith(
        status: 'completed',
        testCompleted: true,
        testScore: score,
        completedAt: DateTime.now(),
        timeSpentSeconds: progress.timeSpentSeconds + (timeSpentSeconds ?? 0),
        lastAccessedAt: DateTime.now(),
      );

      await _storage.saveProgress(updatedProgress);

      // Update user profile
      await _updateUserProfileOnCompletion(
        lessonId: lessonId,
        timeSpent: updatedProgress.timeSpentSeconds,
      );

      // Unlock lesson reward
      await _rewardService.unlockLessonReward(lessonId, score);

      debugPrint('✅ Test score updated: $lessonId - $score% ($stars stars)');
    } catch (e, stackTrace) {
      debugPrint('❌ Error updating test score: $e');
      debugPrint(stackTrace.toString());
    }
  }

  /// Start or resume a lesson
  Future<void> startLesson(String lessonId) async {
    try {
      await _storage.updateLessonStatus(lessonId, 'in_progress');
      debugPrint('🎯 Lesson started: $lessonId');
    } catch (e) {
      debugPrint('❌ Error starting lesson: $e');
    }
  }

  // ============ STATISTICS & ANALYTICS ============

  /// Get overall progress statistics
  ///
  /// Returns:
  /// - Total lessons
  /// - Completed lessons
  /// - In-progress lessons
  /// - Average score
  /// - Total learning time
  /// - Completion percentage
  Future<ProgressStatistics> getOverallProgress() async {
    try {
      final allProgress = _storage.getAllProgress();
      final rewards = _storage
          .getAllRewards()
          .where((r) => r.isUnlocked)
          .toList();

      final completed = allProgress
          .where((p) => p.status == 'completed')
          .toList();
      final inProgress = allProgress
          .where((p) => p.status == 'in_progress')
          .toList();

      // Calculate average score
      double avgScore = 0;
      if (completed.isNotEmpty) {
        final scores = completed
            .where((p) => p.testScore != null)
            .map((p) => p.testScore!);
        if (scores.isNotEmpty) {
          avgScore = scores.reduce((a, b) => a + b) / scores.length;
        }
      }

      // Calculate total learning time
      int totalSeconds = allProgress.fold(
        0,
        (sum, p) => sum + p.timeSpentSeconds,
      );

      return ProgressStatistics(
        totalLessons: allProgress.length,
        completedLessons: completed.length,
        inProgressLessons: inProgress.length,
        averageScore: avgScore,
        totalRewards: rewards.length,
        totalLearningTime: Duration(seconds: totalSeconds),
      );
    } catch (e) {
      debugPrint('❌ Error getting overall progress: $e');
      return const ProgressStatistics(
        totalLessons: 0,
        completedLessons: 0,
        inProgressLessons: 0,
        averageScore: 0,
        totalRewards: 0,
        totalLearningTime: Duration.zero,
      );
    }
  }

  /// Get lesson history sorted by last accessed
  Future<List<LessonProgressHistory>> getLessonHistory({int limit = 10}) async {
    try {
      final allProgress = _storage.getAllProgress();

      // Sort by last accessed (most recent first)
      allProgress.sort((a, b) {
        final dateA = a.lastAccessedAt ?? DateTime(2000);
        final dateB = b.lastAccessedAt ?? DateTime(2000);
        return dateB.compareTo(dateA);
      });

      // Get lesson details for each progress
      final history = <LessonProgressHistory>[];
      for (final progress in allProgress.take(limit)) {
        final lesson = _storage.getLesson(progress.lessonId);
        if (lesson != null) {
          history.add(
            LessonProgressHistory(lesson: lesson, progress: progress),
          );
        }
      }

      return history;
    } catch (e) {
      debugPrint('❌ Error getting lesson history: $e');
      return [];
    }
  }

  /// Get test results for completed lessons
  Future<List<TestResult>> getTestResults() async {
    try {
      final allProgress = _storage.getAllProgress();
      final completedWithScores = allProgress
          .where((p) => p.status == 'completed' && p.testScore != null)
          .toList();

      // Sort by completion date (most recent first)
      completedWithScores.sort((a, b) {
        final dateA = a.completedAt ?? DateTime(2000);
        final dateB = b.completedAt ?? DateTime(2000);
        return dateB.compareTo(dateA);
      });

      final results = <TestResult>[];
      for (final progress in completedWithScores) {
        final lesson = _storage.getLesson(progress.lessonId);
        if (lesson != null) {
          results.add(
            TestResult(
              lessonId: progress.lessonId,
              lessonTitle: lesson.titleKey, // Use titleKey for localization
              score: progress.testScore!,
              stars: _calculateStars(progress.testScore!),
              completedAt: progress.completedAt!,
              attempts: progress.attempts,
            ),
          );
        }
      }

      return results;
    } catch (e) {
      debugPrint('❌ Error getting test results: $e');
      return [];
    }
  }

  /// Get completion rates by difficulty level
  Future<Map<String, double>> getCompletionRates() async {
    try {
      final allLessons = _storage.getAllLessons();
      final allProgress = _storage.getAllProgress();

      final rates = <String, double>{};

      for (final difficulty in ['beginner', 'intermediate', 'advanced']) {
        final lessonsOfDifficulty = allLessons
            .where((l) => l.difficulty == difficulty)
            .toList();
        if (lessonsOfDifficulty.isEmpty) {
          rates[difficulty] = 0;
          continue;
        }

        final completedCount = lessonsOfDifficulty.where((lesson) {
          final progress = allProgress.firstWhere(
            (p) => p.lessonId == lesson.id,
            orElse: () => LessonProgress(
              lessonId: lesson.id,
              status: 'not_started',
              taskCompleted: false,
              testCompleted: false,
              timeSpentSeconds: 0,
              attempts: 0,
            ),
          );
          return progress.status == 'completed';
        }).length;

        rates[difficulty] = (completedCount / lessonsOfDifficulty.length) * 100;
      }

      return rates;
    } catch (e) {
      debugPrint('❌ Error getting completion rates: $e');
      return {};
    }
  }

  /// Get average score percentage
  Future<double> getAverageScore() async {
    try {
      final stats = await getOverallProgress();
      return stats.averageScore;
    } catch (e) {
      debugPrint('❌ Error getting average score: $e');
      return 0;
    }
  }

  /// Get total learning time
  Future<Duration> getTotalTimeSpent() async {
    try {
      final stats = await getOverallProgress();
      return stats.totalLearningTime;
    } catch (e) {
      debugPrint('❌ Error getting total time: $e');
      return Duration.zero;
    }
  }

  /// Get current learning streak (consecutive days)
  Future<int> getStreakDays() async {
    try {
      final allProgress = _storage.getAllProgress();
      if (allProgress.isEmpty) return 0;

      // Get all activity dates
      final activityDates =
          allProgress
              .where((p) => p.lastAccessedAt != null)
              .map((p) => _stripTime(p.lastAccessedAt!))
              .toSet()
              .toList()
            ..sort((a, b) => b.compareTo(a)); // Most recent first

      if (activityDates.isEmpty) return 0;

      // Check if today or yesterday is in the list
      final today = _stripTime(DateTime.now());
      final yesterday = today.subtract(const Duration(days: 1));

      if (!activityDates.contains(today) &&
          !activityDates.contains(yesterday)) {
        return 0; // Streak broken
      }

      // Count consecutive days
      int streak = 0;
      DateTime checkDate = activityDates.contains(today) ? today : yesterday;

      for (final date in activityDates) {
        if (date == checkDate) {
          streak++;
          checkDate = checkDate.subtract(const Duration(days: 1));
        } else if (date.isBefore(checkDate)) {
          break; // Gap found
        }
      }

      return streak;
    } catch (e) {
      debugPrint('❌ Error calculating streak: $e');
      return 0;
    }
  }

  // ============ PRIVATE HELPERS ============

  /// Update user profile statistics after lesson completion
  Future<void> _updateUserProfileOnCompletion({
    required String lessonId,
    required int timeSpent,
  }) async {
    try {
      var profile = _storage.getUserProfile();

      if (profile == null) {
        // Create default profile if none exists
        profile = UserProfile(
          id: 'default_user',
          language: 'en',
          lessonsCompleted: 0,
          rewardsUnlocked: 0,
          totalTimeSpent: 0,
          createdAt: DateTime.now(),
          preferences: {},
        );
      }

      // Update profile stats
      final updatedProfile = profile.copyWith(
        lessonsCompleted: profile.lessonsCompleted + 1,
        totalTimeSpent: profile.totalTimeSpent + timeSpent,
        lastActiveAt: DateTime.now(),
      );

      await _storage.saveUserProfile(updatedProfile);
      debugPrint(
        '✅ User profile updated: ${updatedProfile.lessonsCompleted} lessons completed',
      );
    } catch (e) {
      debugPrint('❌ Error updating user profile: $e');
    }
  }

  /// Calculate stars based on score percentage
  int _calculateStars(double score) {
    if (score >= 90) return 3;
    if (score >= 70) return 2;
    if (score >= 50) return 1;
    return 0;
  }

  /// Strip time from DateTime for date comparisons
  DateTime _stripTime(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }
}

// ============ DATA MODELS ============

/// Statistics about overall progress
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

  int get notStartedLessons =>
      totalLessons - completedLessons - inProgressLessons;
}

/// Lesson progress history item
class LessonProgressHistory {
  final Lesson lesson;
  final LessonProgress progress;

  const LessonProgressHistory({required this.lesson, required this.progress});
}

/// Test result for completed lesson
class TestResult {
  final String lessonId;
  final String lessonTitle;
  final double score;
  final int stars;
  final DateTime completedAt;
  final int attempts;

  const TestResult({
    required this.lessonId,
    required this.lessonTitle,
    required this.score,
    required this.stars,
    required this.completedAt,
    required this.attempts,
  });
}
