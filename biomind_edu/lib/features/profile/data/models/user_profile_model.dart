import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'user_profile_model.freezed.dart';
part 'user_profile_model.g.dart';

/// User profile with progress and achievements tracking
@freezed
class UserProfile with _$UserProfile {
  @HiveType(typeId: 6, adapterName: 'UserProfileAdapter')
  const factory UserProfile({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) @Default(0) int totalLessonsCompleted,
    @HiveField(3) @Default(0) int totalTestsCompleted,
    @HiveField(4) @Default(0) int totalStarsEarned,
    @HiveField(5) @Default(0) int rewardsUnlocked,
    @HiveField(6) @Default([]) List<String> unlockedRewardIds,
    @HiveField(7) DateTime? createdAt,
    @HiveField(8) DateTime? lastActiveAt,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
