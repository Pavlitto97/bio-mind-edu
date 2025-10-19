import 'package:hive_flutter/hive_flutter.dart';

import '../constants/app_constants.dart';
import '../../shared/models/lesson.dart';
import '../../shared/models/progress.dart';

/// Local Storage Service using Hive
/// 
/// Manages local data persistence for lessons, progress, and rewards.
/// Provides CRUD operations with type-safe access.
class LocalStorageService {
  static final LocalStorageService _instance = LocalStorageService._internal();
  
  factory LocalStorageService() => _instance;
  
  LocalStorageService._internal();

  /// Hive boxes
  Box<dynamic>? _lessonsBox;
  Box<dynamic>? _progressBox;
  Box<dynamic>? _rewardsBox;
  Box<dynamic>? _settingsBox;

  /// Initialize Hive and open boxes
  Future<void> initialize() async {
    // Open boxes
    _lessonsBox = await Hive.openBox(StorageConstants.lessonsBox);
    _progressBox = await Hive.openBox(StorageConstants.progressBox);
    _rewardsBox = await Hive.openBox(StorageConstants.rewardsBox);
    _settingsBox = await Hive.openBox(StorageConstants.settingsBox);
  }

  /// Check if initialized
  bool get isInitialized =>
      _lessonsBox != null &&
      _progressBox != null &&
      _rewardsBox != null &&
      _settingsBox != null;

  // ============ LESSONS ============

  /// Save lesson
  Future<void> saveLesson(Lesson lesson) async {
    await _lessonsBox?.put(lesson.id, lesson.toJson());
  }

  /// Get lesson by ID
  Lesson? getLesson(String lessonId) {
    final json = _lessonsBox?.get(lessonId);
    if (json == null) return null;
    return Lesson.fromJson(Map<String, dynamic>.from(json as Map));
  }

  /// Get all lessons
  List<Lesson> getAllLessons() {
    final lessons = <Lesson>[];
    for (final key in _lessonsBox?.keys ?? []) {
      final json = _lessonsBox?.get(key);
      if (json != null) {
        lessons.add(Lesson.fromJson(Map<String, dynamic>.from(json as Map)));
      }
    }
    return lessons;
  }

  /// Delete lesson
  Future<void> deleteLesson(String lessonId) async {
    await _lessonsBox?.delete(lessonId);
  }

  /// Save multiple lessons
  Future<void> saveLessons(List<Lesson> lessons) async {
    for (final lesson in lessons) {
      await saveLesson(lesson);
    }
  }

  // ============ PROGRESS ============

  /// Save lesson progress
  Future<void> saveProgress(LessonProgress progress) async {
    await _progressBox?.put(progress.lessonId, progress.toJson());
  }

  /// Get lesson progress
  LessonProgress? getProgress(String lessonId) {
    final json = _progressBox?.get(lessonId);
    if (json == null) return null;
    return LessonProgress.fromJson(Map<String, dynamic>.from(json as Map));
  }

  /// Get all progress
  List<LessonProgress> getAllProgress() {
    final progressList = <LessonProgress>[];
    for (final key in _progressBox?.keys ?? []) {
      final json = _progressBox?.get(key);
      if (json != null) {
        progressList.add(
          LessonProgress.fromJson(Map<String, dynamic>.from(json as Map)),
        );
      }
    }
    return progressList;
  }

  /// Update lesson status
  Future<void> updateLessonStatus(String lessonId, String status) async {
    final progress = getProgress(lessonId);
    if (progress != null) {
      final updated = progress.copyWith(
        status: status,
        lastAccessedAt: DateTime.now(),
      );
      await saveProgress(updated);
    } else {
      // Create new progress record
      final newProgress = LessonProgress(
        lessonId: lessonId,
        status: status,
        lastAccessedAt: DateTime.now(),
      );
      await saveProgress(newProgress);
    }
  }

  /// Mark lesson as completed
  Future<void> markLessonCompleted(
    String lessonId, {
    double? testScore,
  }) async {
    final progress = getProgress(lessonId);
    final updated = (progress ?? LessonProgress(lessonId: lessonId, status: 'not_started'))
        .copyWith(
      status: 'completed',
      completedAt: DateTime.now(),
      testScore: testScore,
    );
    await saveProgress(updated);
  }

  // ============ REWARDS ============

  /// Save reward
  Future<void> saveReward(Reward reward) async {
    await _rewardsBox?.put(reward.id, reward.toJson());
  }

  /// Get reward by ID
  Reward? getReward(String rewardId) {
    final json = _rewardsBox?.get(rewardId);
    if (json == null) return null;
    return Reward.fromJson(Map<String, dynamic>.from(json as Map));
  }

  /// Get all rewards
  List<Reward> getAllRewards() {
    final rewards = <Reward>[];
    for (final key in _rewardsBox?.keys ?? []) {
      final json = _rewardsBox?.get(key);
      if (json != null) {
        rewards.add(Reward.fromJson(Map<String, dynamic>.from(json as Map)));
      }
    }
    return rewards;
  }

  /// Get unlocked rewards
  List<Reward> getUnlockedRewards() {
    return getAllRewards().where((r) => r.isUnlocked).toList();
  }

  /// Unlock reward
  Future<void> unlockReward(String rewardId) async {
    final reward = getReward(rewardId);
    if (reward != null) {
      final unlocked = reward.copyWith(
        isUnlocked: true,
        unlockedAt: DateTime.now(),
      );
      await saveReward(unlocked);
    }
  }

  // ============ SETTINGS ============

  /// Save setting
  Future<void> saveSetting(String key, dynamic value) async {
    await _settingsBox?.put(key, value);
  }

  /// Get setting
  T? getSetting<T>(String key) {
    return _settingsBox?.get(key) as T?;
  }

  /// Delete setting
  Future<void> deleteSetting(String key) async {
    await _settingsBox?.delete(key);
  }

  /// Get language preference
  String getLanguage() {
    return getSetting<String>(StorageConstants.languageKey) ??
        LocaleConstants.defaultLocale;
  }

  /// Save language preference
  Future<void> saveLanguage(String languageCode) async {
    await saveSetting(StorageConstants.languageKey, languageCode);
  }

  /// Check if first launch
  bool isFirstLaunch() {
    return getSetting<bool>(StorageConstants.firstLaunchKey) ?? true;
  }

  /// Mark first launch as completed
  Future<void> markFirstLaunchCompleted() async {
    await saveSetting(StorageConstants.firstLaunchKey, false);
  }

  // ============ STATISTICS ============

  /// Get total completed lessons
  int getCompletedLessonsCount() {
    return getAllProgress()
        .where((p) => p.status == 'completed')
        .length;
  }

  /// Get total unlocked rewards
  int getUnlockedRewardsCount() {
    return getUnlockedRewards().length;
  }

  /// Get total time spent (seconds)
  int getTotalTimeSpent() {
    return getAllProgress().fold(0, (sum, p) => sum + p.timeSpentSeconds);
  }

  // ============ CLEANUP ============

  /// Clear all data
  Future<void> clearAllData() async {
    await _lessonsBox?.clear();
    await _progressBox?.clear();
    await _rewardsBox?.clear();
    // Don't clear settings
  }

  /// Clear progress only
  Future<void> clearProgress() async {
    await _progressBox?.clear();
  }

  // ============ USER PROFILE ============

  /// Save user profile
  Future<void> saveUserProfile(UserProfile profile) async {
    await _settingsBox?.put('user_profile', profile.toJson());
  }

  /// Get user profile
  UserProfile? getUserProfile() {
    final json = _settingsBox?.get('user_profile');
    if (json == null) return null;
    return UserProfile.fromJson(Map<String, dynamic>.from(json as Map));
  }

  /// Update user profile preference
  Future<void> updateUserPreference(String key, dynamic value) async {
    final profile = getUserProfile();
    if (profile == null) return;

    final updatedPreferences = {...profile.preferences, key: value};
    final updatedProfile = profile.copyWith(preferences: updatedPreferences);
    await saveUserProfile(updatedProfile);
  }

  /// Delete user profile
  Future<void> deleteUserProfile() async {
    await _settingsBox?.delete('user_profile');
  }

  // ============================================================

  /// Close all boxes
  Future<void> dispose() async {
    await _lessonsBox?.close();
    await _progressBox?.close();
    await _rewardsBox?.close();
    await _settingsBox?.close();
  }
}
