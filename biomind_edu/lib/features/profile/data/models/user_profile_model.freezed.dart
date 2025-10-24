// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return _UserProfile.fromJson(json);
}

/// @nodoc
mixin _$UserProfile {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  int get totalLessonsCompleted => throw _privateConstructorUsedError;
  @HiveField(3)
  int get totalTestsCompleted => throw _privateConstructorUsedError;
  @HiveField(4)
  int get totalStarsEarned => throw _privateConstructorUsedError;
  @HiveField(5)
  int get rewardsUnlocked => throw _privateConstructorUsedError;
  @HiveField(6)
  List<String> get unlockedRewardIds => throw _privateConstructorUsedError;
  @HiveField(7)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @HiveField(8)
  DateTime? get lastActiveAt => throw _privateConstructorUsedError;

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProfileCopyWith<UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
          UserProfile value, $Res Function(UserProfile) then) =
      _$UserProfileCopyWithImpl<$Res, UserProfile>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) int totalLessonsCompleted,
      @HiveField(3) int totalTestsCompleted,
      @HiveField(4) int totalStarsEarned,
      @HiveField(5) int rewardsUnlocked,
      @HiveField(6) List<String> unlockedRewardIds,
      @HiveField(7) DateTime? createdAt,
      @HiveField(8) DateTime? lastActiveAt});
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res, $Val extends UserProfile>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? totalLessonsCompleted = null,
    Object? totalTestsCompleted = null,
    Object? totalStarsEarned = null,
    Object? rewardsUnlocked = null,
    Object? unlockedRewardIds = null,
    Object? createdAt = freezed,
    Object? lastActiveAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      totalLessonsCompleted: null == totalLessonsCompleted
          ? _value.totalLessonsCompleted
          : totalLessonsCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      totalTestsCompleted: null == totalTestsCompleted
          ? _value.totalTestsCompleted
          : totalTestsCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      totalStarsEarned: null == totalStarsEarned
          ? _value.totalStarsEarned
          : totalStarsEarned // ignore: cast_nullable_to_non_nullable
              as int,
      rewardsUnlocked: null == rewardsUnlocked
          ? _value.rewardsUnlocked
          : rewardsUnlocked // ignore: cast_nullable_to_non_nullable
              as int,
      unlockedRewardIds: null == unlockedRewardIds
          ? _value.unlockedRewardIds
          : unlockedRewardIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastActiveAt: freezed == lastActiveAt
          ? _value.lastActiveAt
          : lastActiveAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserProfileImplCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$$UserProfileImplCopyWith(
          _$UserProfileImpl value, $Res Function(_$UserProfileImpl) then) =
      __$$UserProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) int totalLessonsCompleted,
      @HiveField(3) int totalTestsCompleted,
      @HiveField(4) int totalStarsEarned,
      @HiveField(5) int rewardsUnlocked,
      @HiveField(6) List<String> unlockedRewardIds,
      @HiveField(7) DateTime? createdAt,
      @HiveField(8) DateTime? lastActiveAt});
}

/// @nodoc
class __$$UserProfileImplCopyWithImpl<$Res>
    extends _$UserProfileCopyWithImpl<$Res, _$UserProfileImpl>
    implements _$$UserProfileImplCopyWith<$Res> {
  __$$UserProfileImplCopyWithImpl(
      _$UserProfileImpl _value, $Res Function(_$UserProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? totalLessonsCompleted = null,
    Object? totalTestsCompleted = null,
    Object? totalStarsEarned = null,
    Object? rewardsUnlocked = null,
    Object? unlockedRewardIds = null,
    Object? createdAt = freezed,
    Object? lastActiveAt = freezed,
  }) {
    return _then(_$UserProfileImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      totalLessonsCompleted: null == totalLessonsCompleted
          ? _value.totalLessonsCompleted
          : totalLessonsCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      totalTestsCompleted: null == totalTestsCompleted
          ? _value.totalTestsCompleted
          : totalTestsCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      totalStarsEarned: null == totalStarsEarned
          ? _value.totalStarsEarned
          : totalStarsEarned // ignore: cast_nullable_to_non_nullable
              as int,
      rewardsUnlocked: null == rewardsUnlocked
          ? _value.rewardsUnlocked
          : rewardsUnlocked // ignore: cast_nullable_to_non_nullable
              as int,
      unlockedRewardIds: null == unlockedRewardIds
          ? _value._unlockedRewardIds
          : unlockedRewardIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastActiveAt: freezed == lastActiveAt
          ? _value.lastActiveAt
          : lastActiveAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 6, adapterName: 'UserProfileAdapter')
class _$UserProfileImpl implements _UserProfile {
  const _$UserProfileImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) this.totalLessonsCompleted = 0,
      @HiveField(3) this.totalTestsCompleted = 0,
      @HiveField(4) this.totalStarsEarned = 0,
      @HiveField(5) this.rewardsUnlocked = 0,
      @HiveField(6) final List<String> unlockedRewardIds = const [],
      @HiveField(7) this.createdAt,
      @HiveField(8) this.lastActiveAt})
      : _unlockedRewardIds = unlockedRewardIds;

  factory _$UserProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String name;
  @override
  @JsonKey()
  @HiveField(2)
  final int totalLessonsCompleted;
  @override
  @JsonKey()
  @HiveField(3)
  final int totalTestsCompleted;
  @override
  @JsonKey()
  @HiveField(4)
  final int totalStarsEarned;
  @override
  @JsonKey()
  @HiveField(5)
  final int rewardsUnlocked;
  final List<String> _unlockedRewardIds;
  @override
  @JsonKey()
  @HiveField(6)
  List<String> get unlockedRewardIds {
    if (_unlockedRewardIds is EqualUnmodifiableListView)
      return _unlockedRewardIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_unlockedRewardIds);
  }

  @override
  @HiveField(7)
  final DateTime? createdAt;
  @override
  @HiveField(8)
  final DateTime? lastActiveAt;

  @override
  String toString() {
    return 'UserProfile(id: $id, name: $name, totalLessonsCompleted: $totalLessonsCompleted, totalTestsCompleted: $totalTestsCompleted, totalStarsEarned: $totalStarsEarned, rewardsUnlocked: $rewardsUnlocked, unlockedRewardIds: $unlockedRewardIds, createdAt: $createdAt, lastActiveAt: $lastActiveAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.totalLessonsCompleted, totalLessonsCompleted) ||
                other.totalLessonsCompleted == totalLessonsCompleted) &&
            (identical(other.totalTestsCompleted, totalTestsCompleted) ||
                other.totalTestsCompleted == totalTestsCompleted) &&
            (identical(other.totalStarsEarned, totalStarsEarned) ||
                other.totalStarsEarned == totalStarsEarned) &&
            (identical(other.rewardsUnlocked, rewardsUnlocked) ||
                other.rewardsUnlocked == rewardsUnlocked) &&
            const DeepCollectionEquality()
                .equals(other._unlockedRewardIds, _unlockedRewardIds) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastActiveAt, lastActiveAt) ||
                other.lastActiveAt == lastActiveAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      totalLessonsCompleted,
      totalTestsCompleted,
      totalStarsEarned,
      rewardsUnlocked,
      const DeepCollectionEquality().hash(_unlockedRewardIds),
      createdAt,
      lastActiveAt);

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      __$$UserProfileImplCopyWithImpl<_$UserProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileImplToJson(
      this,
    );
  }
}

abstract class _UserProfile implements UserProfile {
  const factory _UserProfile(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String name,
      @HiveField(2) final int totalLessonsCompleted,
      @HiveField(3) final int totalTestsCompleted,
      @HiveField(4) final int totalStarsEarned,
      @HiveField(5) final int rewardsUnlocked,
      @HiveField(6) final List<String> unlockedRewardIds,
      @HiveField(7) final DateTime? createdAt,
      @HiveField(8) final DateTime? lastActiveAt}) = _$UserProfileImpl;

  factory _UserProfile.fromJson(Map<String, dynamic> json) =
      _$UserProfileImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  int get totalLessonsCompleted;
  @override
  @HiveField(3)
  int get totalTestsCompleted;
  @override
  @HiveField(4)
  int get totalStarsEarned;
  @override
  @HiveField(5)
  int get rewardsUnlocked;
  @override
  @HiveField(6)
  List<String> get unlockedRewardIds;
  @override
  @HiveField(7)
  DateTime? get createdAt;
  @override
  @HiveField(8)
  DateTime? get lastActiveAt;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
