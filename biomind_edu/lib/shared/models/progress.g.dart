// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LessonProgressImpl _$$LessonProgressImplFromJson(Map<String, dynamic> json) =>
    _$LessonProgressImpl(
      userId: json['userId'] as String?,
      lessonId: json['lessonId'] as String,
      status: json['status'] as String,
      lastAccessedAt: json['lastAccessedAt'] == null
          ? null
          : DateTime.parse(json['lastAccessedAt'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      taskCompleted: json['taskCompleted'] as bool? ?? false,
      testCompleted: json['testCompleted'] as bool? ?? false,
      testScore: (json['testScore'] as num?)?.toDouble(),
      timeSpentSeconds: (json['timeSpentSeconds'] as num?)?.toInt() ?? 0,
      attempts: (json['attempts'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$LessonProgressImplToJson(
        _$LessonProgressImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'lessonId': instance.lessonId,
      'status': instance.status,
      'lastAccessedAt': instance.lastAccessedAt?.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
      'taskCompleted': instance.taskCompleted,
      'testCompleted': instance.testCompleted,
      'testScore': instance.testScore,
      'timeSpentSeconds': instance.timeSpentSeconds,
      'attempts': instance.attempts,
    };

_$RewardImpl _$$RewardImplFromJson(Map<String, dynamic> json) => _$RewardImpl(
      id: json['id'] as String,
      nameKey: json['nameKey'] as String,
      descriptionKey: json['descriptionKey'] as String,
      imagePath: json['imagePath'] as String,
      type: json['type'] as String? ?? 'sticker',
      unlockCondition: json['unlockCondition'] as String,
      isUnlocked: json['isUnlocked'] as bool? ?? false,
      unlockedAt: json['unlockedAt'] == null
          ? null
          : DateTime.parse(json['unlockedAt'] as String),
      rarity: json['rarity'] as String? ?? 'common',
    );

Map<String, dynamic> _$$RewardImplToJson(_$RewardImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameKey': instance.nameKey,
      'descriptionKey': instance.descriptionKey,
      'imagePath': instance.imagePath,
      'type': instance.type,
      'unlockCondition': instance.unlockCondition,
      'isUnlocked': instance.isUnlocked,
      'unlockedAt': instance.unlockedAt?.toIso8601String(),
      'rarity': instance.rarity,
    };

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      id: json['id'] as String,
      displayName: json['displayName'] as String?,
      age: (json['age'] as num?)?.toInt(),
      language: json['language'] as String? ?? 'en',
      avatarPath: json['avatarPath'] as String?,
      lessonsCompleted: (json['lessonsCompleted'] as num?)?.toInt() ?? 0,
      rewardsUnlocked: (json['rewardsUnlocked'] as num?)?.toInt() ?? 0,
      totalTimeSpent: (json['totalTimeSpent'] as num?)?.toInt() ?? 0,
      createdAt: DateTime.parse(json['createdAt'] as String),
      lastActiveAt: json['lastActiveAt'] == null
          ? null
          : DateTime.parse(json['lastActiveAt'] as String),
      preferences: json['preferences'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'age': instance.age,
      'language': instance.language,
      'avatarPath': instance.avatarPath,
      'lessonsCompleted': instance.lessonsCompleted,
      'rewardsUnlocked': instance.rewardsUnlocked,
      'totalTimeSpent': instance.totalTimeSpent,
      'createdAt': instance.createdAt.toIso8601String(),
      'lastActiveAt': instance.lastActiveAt?.toIso8601String(),
      'preferences': instance.preferences,
    };
