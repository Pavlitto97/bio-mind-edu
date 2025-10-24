// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserProfileAdapter extends TypeAdapter<_$UserProfileImpl> {
  @override
  final int typeId = 6;

  @override
  _$UserProfileImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$UserProfileImpl(
      id: fields[0] as String,
      name: fields[1] as String,
      totalLessonsCompleted: fields[2] as int,
      totalTestsCompleted: fields[3] as int,
      totalStarsEarned: fields[4] as int,
      rewardsUnlocked: fields[5] as int,
      unlockedRewardIds: (fields[6] as List).cast<String>(),
      createdAt: fields[7] as DateTime?,
      lastActiveAt: fields[8] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, _$UserProfileImpl obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.totalLessonsCompleted)
      ..writeByte(3)
      ..write(obj.totalTestsCompleted)
      ..writeByte(4)
      ..write(obj.totalStarsEarned)
      ..writeByte(5)
      ..write(obj.rewardsUnlocked)
      ..writeByte(7)
      ..write(obj.createdAt)
      ..writeByte(8)
      ..write(obj.lastActiveAt)
      ..writeByte(6)
      ..write(obj.unlockedRewardIds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserProfileAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      totalLessonsCompleted:
          (json['totalLessonsCompleted'] as num?)?.toInt() ?? 0,
      totalTestsCompleted: (json['totalTestsCompleted'] as num?)?.toInt() ?? 0,
      totalStarsEarned: (json['totalStarsEarned'] as num?)?.toInt() ?? 0,
      rewardsUnlocked: (json['rewardsUnlocked'] as num?)?.toInt() ?? 0,
      unlockedRewardIds: (json['unlockedRewardIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      lastActiveAt: json['lastActiveAt'] == null
          ? null
          : DateTime.parse(json['lastActiveAt'] as String),
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'totalLessonsCompleted': instance.totalLessonsCompleted,
      'totalTestsCompleted': instance.totalTestsCompleted,
      'totalStarsEarned': instance.totalStarsEarned,
      'rewardsUnlocked': instance.rewardsUnlocked,
      'unlockedRewardIds': instance.unlockedRewardIds,
      'createdAt': instance.createdAt?.toIso8601String(),
      'lastActiveAt': instance.lastActiveAt?.toIso8601String(),
    };
