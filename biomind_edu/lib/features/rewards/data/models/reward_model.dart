import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'reward_model.freezed.dart';
part 'reward_model.g.dart';

/// Model representing a reward that can be unlocked
@freezed
class Reward with _$Reward {
  @HiveType(typeId: 4, adapterName: 'RewardAdapter')
  const factory Reward({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) required String description,
    @HiveField(3) required String imageUrl,
    @HiveField(4) required RewardCategory category,
    @HiveField(5) @Default(false) bool isUnlocked,
    @HiveField(6) DateTime? unlockedAt,
  }) = _Reward;

  factory Reward.fromJson(Map<String, dynamic> json) => _$RewardFromJson(json);
}

/// Categories of rewards
@HiveType(typeId: 5, adapterName: 'RewardCategoryAdapter')
enum RewardCategory {
  @HiveField(0)
  badge,
  @HiveField(1)
  sticker,
  @HiveField(2)
  achievement,
  @HiveField(3)
  trophy,
}
