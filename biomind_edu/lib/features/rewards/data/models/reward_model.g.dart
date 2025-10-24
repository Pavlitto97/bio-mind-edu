// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reward_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RewardCategoryAdapter extends TypeAdapter<RewardCategory> {
  @override
  final int typeId = 5;

  @override
  RewardCategory read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return RewardCategory.badge;
      case 1:
        return RewardCategory.sticker;
      case 2:
        return RewardCategory.achievement;
      case 3:
        return RewardCategory.trophy;
      default:
        return RewardCategory.badge;
    }
  }

  @override
  void write(BinaryWriter writer, RewardCategory obj) {
    switch (obj) {
      case RewardCategory.badge:
        writer.writeByte(0);
        break;
      case RewardCategory.sticker:
        writer.writeByte(1);
        break;
      case RewardCategory.achievement:
        writer.writeByte(2);
        break;
      case RewardCategory.trophy:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RewardCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RewardAdapter extends TypeAdapter<_$RewardImpl> {
  @override
  final int typeId = 4;

  @override
  _$RewardImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$RewardImpl(
      id: fields[0] as String,
      name: fields[1] as String,
      description: fields[2] as String,
      imageUrl: fields[3] as String,
      category: fields[4] as RewardCategory,
      isUnlocked: fields[5] as bool,
      unlockedAt: fields[6] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, _$RewardImpl obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.imageUrl)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.isUnlocked)
      ..writeByte(6)
      ..write(obj.unlockedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RewardAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RewardImpl _$$RewardImplFromJson(Map<String, dynamic> json) => _$RewardImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      category: $enumDecode(_$RewardCategoryEnumMap, json['category']),
      isUnlocked: json['isUnlocked'] as bool? ?? false,
      unlockedAt: json['unlockedAt'] == null
          ? null
          : DateTime.parse(json['unlockedAt'] as String),
    );

Map<String, dynamic> _$$RewardImplToJson(_$RewardImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'category': _$RewardCategoryEnumMap[instance.category]!,
      'isUnlocked': instance.isUnlocked,
      'unlockedAt': instance.unlockedAt?.toIso8601String(),
    };

const _$RewardCategoryEnumMap = {
  RewardCategory.badge: 'badge',
  RewardCategory.sticker: 'sticker',
  RewardCategory.achievement: 'achievement',
  RewardCategory.trophy: 'trophy',
};
