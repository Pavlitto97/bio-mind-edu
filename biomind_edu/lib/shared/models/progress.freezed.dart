// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LessonProgress _$LessonProgressFromJson(Map<String, dynamic> json) {
  return _LessonProgress.fromJson(json);
}

/// @nodoc
mixin _$LessonProgress {
  /// User ID (optional for local storage)
  String? get userId => throw _privateConstructorUsedError;

  /// Lesson ID
  String get lessonId => throw _privateConstructorUsedError;

  /// Current lesson status
  String get status =>
      throw _privateConstructorUsedError; // 'not_started', 'in_progress', 'completed'
  /// Last accessed timestamp
  DateTime? get lastAccessedAt => throw _privateConstructorUsedError;

  /// Completion timestamp
  DateTime? get completedAt => throw _privateConstructorUsedError;

  /// Interactive task completed
  bool get taskCompleted => throw _privateConstructorUsedError;

  /// Assessment test completed
  bool get testCompleted => throw _privateConstructorUsedError;

  /// Test score (0.0 - 1.0)
  double? get testScore => throw _privateConstructorUsedError;

  /// Time spent in seconds
  int get timeSpentSeconds => throw _privateConstructorUsedError;

  /// Number of attempts
  int get attempts => throw _privateConstructorUsedError;

  /// Serializes this LessonProgress to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LessonProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LessonProgressCopyWith<LessonProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonProgressCopyWith<$Res> {
  factory $LessonProgressCopyWith(
          LessonProgress value, $Res Function(LessonProgress) then) =
      _$LessonProgressCopyWithImpl<$Res, LessonProgress>;
  @useResult
  $Res call(
      {String? userId,
      String lessonId,
      String status,
      DateTime? lastAccessedAt,
      DateTime? completedAt,
      bool taskCompleted,
      bool testCompleted,
      double? testScore,
      int timeSpentSeconds,
      int attempts});
}

/// @nodoc
class _$LessonProgressCopyWithImpl<$Res, $Val extends LessonProgress>
    implements $LessonProgressCopyWith<$Res> {
  _$LessonProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LessonProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? lessonId = null,
    Object? status = null,
    Object? lastAccessedAt = freezed,
    Object? completedAt = freezed,
    Object? taskCompleted = null,
    Object? testCompleted = null,
    Object? testScore = freezed,
    Object? timeSpentSeconds = null,
    Object? attempts = null,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      lessonId: null == lessonId
          ? _value.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      lastAccessedAt: freezed == lastAccessedAt
          ? _value.lastAccessedAt
          : lastAccessedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      taskCompleted: null == taskCompleted
          ? _value.taskCompleted
          : taskCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      testCompleted: null == testCompleted
          ? _value.testCompleted
          : testCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      testScore: freezed == testScore
          ? _value.testScore
          : testScore // ignore: cast_nullable_to_non_nullable
              as double?,
      timeSpentSeconds: null == timeSpentSeconds
          ? _value.timeSpentSeconds
          : timeSpentSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      attempts: null == attempts
          ? _value.attempts
          : attempts // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LessonProgressImplCopyWith<$Res>
    implements $LessonProgressCopyWith<$Res> {
  factory _$$LessonProgressImplCopyWith(_$LessonProgressImpl value,
          $Res Function(_$LessonProgressImpl) then) =
      __$$LessonProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? userId,
      String lessonId,
      String status,
      DateTime? lastAccessedAt,
      DateTime? completedAt,
      bool taskCompleted,
      bool testCompleted,
      double? testScore,
      int timeSpentSeconds,
      int attempts});
}

/// @nodoc
class __$$LessonProgressImplCopyWithImpl<$Res>
    extends _$LessonProgressCopyWithImpl<$Res, _$LessonProgressImpl>
    implements _$$LessonProgressImplCopyWith<$Res> {
  __$$LessonProgressImplCopyWithImpl(
      _$LessonProgressImpl _value, $Res Function(_$LessonProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of LessonProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? lessonId = null,
    Object? status = null,
    Object? lastAccessedAt = freezed,
    Object? completedAt = freezed,
    Object? taskCompleted = null,
    Object? testCompleted = null,
    Object? testScore = freezed,
    Object? timeSpentSeconds = null,
    Object? attempts = null,
  }) {
    return _then(_$LessonProgressImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      lessonId: null == lessonId
          ? _value.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      lastAccessedAt: freezed == lastAccessedAt
          ? _value.lastAccessedAt
          : lastAccessedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      taskCompleted: null == taskCompleted
          ? _value.taskCompleted
          : taskCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      testCompleted: null == testCompleted
          ? _value.testCompleted
          : testCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      testScore: freezed == testScore
          ? _value.testScore
          : testScore // ignore: cast_nullable_to_non_nullable
              as double?,
      timeSpentSeconds: null == timeSpentSeconds
          ? _value.timeSpentSeconds
          : timeSpentSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      attempts: null == attempts
          ? _value.attempts
          : attempts // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LessonProgressImpl implements _LessonProgress {
  const _$LessonProgressImpl(
      {this.userId,
      required this.lessonId,
      required this.status,
      this.lastAccessedAt,
      this.completedAt,
      this.taskCompleted = false,
      this.testCompleted = false,
      this.testScore,
      this.timeSpentSeconds = 0,
      this.attempts = 0});

  factory _$LessonProgressImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonProgressImplFromJson(json);

  /// User ID (optional for local storage)
  @override
  final String? userId;

  /// Lesson ID
  @override
  final String lessonId;

  /// Current lesson status
  @override
  final String status;
// 'not_started', 'in_progress', 'completed'
  /// Last accessed timestamp
  @override
  final DateTime? lastAccessedAt;

  /// Completion timestamp
  @override
  final DateTime? completedAt;

  /// Interactive task completed
  @override
  @JsonKey()
  final bool taskCompleted;

  /// Assessment test completed
  @override
  @JsonKey()
  final bool testCompleted;

  /// Test score (0.0 - 1.0)
  @override
  final double? testScore;

  /// Time spent in seconds
  @override
  @JsonKey()
  final int timeSpentSeconds;

  /// Number of attempts
  @override
  @JsonKey()
  final int attempts;

  @override
  String toString() {
    return 'LessonProgress(userId: $userId, lessonId: $lessonId, status: $status, lastAccessedAt: $lastAccessedAt, completedAt: $completedAt, taskCompleted: $taskCompleted, testCompleted: $testCompleted, testScore: $testScore, timeSpentSeconds: $timeSpentSeconds, attempts: $attempts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonProgressImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.lessonId, lessonId) ||
                other.lessonId == lessonId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.lastAccessedAt, lastAccessedAt) ||
                other.lastAccessedAt == lastAccessedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.taskCompleted, taskCompleted) ||
                other.taskCompleted == taskCompleted) &&
            (identical(other.testCompleted, testCompleted) ||
                other.testCompleted == testCompleted) &&
            (identical(other.testScore, testScore) ||
                other.testScore == testScore) &&
            (identical(other.timeSpentSeconds, timeSpentSeconds) ||
                other.timeSpentSeconds == timeSpentSeconds) &&
            (identical(other.attempts, attempts) ||
                other.attempts == attempts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      lessonId,
      status,
      lastAccessedAt,
      completedAt,
      taskCompleted,
      testCompleted,
      testScore,
      timeSpentSeconds,
      attempts);

  /// Create a copy of LessonProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonProgressImplCopyWith<_$LessonProgressImpl> get copyWith =>
      __$$LessonProgressImplCopyWithImpl<_$LessonProgressImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonProgressImplToJson(
      this,
    );
  }
}

abstract class _LessonProgress implements LessonProgress {
  const factory _LessonProgress(
      {final String? userId,
      required final String lessonId,
      required final String status,
      final DateTime? lastAccessedAt,
      final DateTime? completedAt,
      final bool taskCompleted,
      final bool testCompleted,
      final double? testScore,
      final int timeSpentSeconds,
      final int attempts}) = _$LessonProgressImpl;

  factory _LessonProgress.fromJson(Map<String, dynamic> json) =
      _$LessonProgressImpl.fromJson;

  /// User ID (optional for local storage)
  @override
  String? get userId;

  /// Lesson ID
  @override
  String get lessonId;

  /// Current lesson status
  @override
  String get status; // 'not_started', 'in_progress', 'completed'
  /// Last accessed timestamp
  @override
  DateTime? get lastAccessedAt;

  /// Completion timestamp
  @override
  DateTime? get completedAt;

  /// Interactive task completed
  @override
  bool get taskCompleted;

  /// Assessment test completed
  @override
  bool get testCompleted;

  /// Test score (0.0 - 1.0)
  @override
  double? get testScore;

  /// Time spent in seconds
  @override
  int get timeSpentSeconds;

  /// Number of attempts
  @override
  int get attempts;

  /// Create a copy of LessonProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LessonProgressImplCopyWith<_$LessonProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Reward _$RewardFromJson(Map<String, dynamic> json) {
  return _Reward.fromJson(json);
}

/// @nodoc
mixin _$Reward {
  /// Reward ID
  String get id => throw _privateConstructorUsedError;

  /// Reward name (localized key)
  String get nameKey => throw _privateConstructorUsedError;

  /// Reward description (localized key)
  String get descriptionKey => throw _privateConstructorUsedError;

  /// Reward image path
  String get imagePath => throw _privateConstructorUsedError;

  /// Reward type (sticker, badge, certificate)
  String get type => throw _privateConstructorUsedError;

  /// Unlock condition (lesson completion, test score, etc)
  String get unlockCondition => throw _privateConstructorUsedError;

  /// Is unlocked
  bool get isUnlocked => throw _privateConstructorUsedError;

  /// Unlock timestamp
  DateTime? get unlockedAt => throw _privateConstructorUsedError;

  /// Rarity (common, rare, epic, legendary)
  String get rarity => throw _privateConstructorUsedError;

  /// Serializes this Reward to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Reward
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RewardCopyWith<Reward> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RewardCopyWith<$Res> {
  factory $RewardCopyWith(Reward value, $Res Function(Reward) then) =
      _$RewardCopyWithImpl<$Res, Reward>;
  @useResult
  $Res call(
      {String id,
      String nameKey,
      String descriptionKey,
      String imagePath,
      String type,
      String unlockCondition,
      bool isUnlocked,
      DateTime? unlockedAt,
      String rarity});
}

/// @nodoc
class _$RewardCopyWithImpl<$Res, $Val extends Reward>
    implements $RewardCopyWith<$Res> {
  _$RewardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Reward
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nameKey = null,
    Object? descriptionKey = null,
    Object? imagePath = null,
    Object? type = null,
    Object? unlockCondition = null,
    Object? isUnlocked = null,
    Object? unlockedAt = freezed,
    Object? rarity = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nameKey: null == nameKey
          ? _value.nameKey
          : nameKey // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionKey: null == descriptionKey
          ? _value.descriptionKey
          : descriptionKey // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      unlockCondition: null == unlockCondition
          ? _value.unlockCondition
          : unlockCondition // ignore: cast_nullable_to_non_nullable
              as String,
      isUnlocked: null == isUnlocked
          ? _value.isUnlocked
          : isUnlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      unlockedAt: freezed == unlockedAt
          ? _value.unlockedAt
          : unlockedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rarity: null == rarity
          ? _value.rarity
          : rarity // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RewardImplCopyWith<$Res> implements $RewardCopyWith<$Res> {
  factory _$$RewardImplCopyWith(
          _$RewardImpl value, $Res Function(_$RewardImpl) then) =
      __$$RewardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String nameKey,
      String descriptionKey,
      String imagePath,
      String type,
      String unlockCondition,
      bool isUnlocked,
      DateTime? unlockedAt,
      String rarity});
}

/// @nodoc
class __$$RewardImplCopyWithImpl<$Res>
    extends _$RewardCopyWithImpl<$Res, _$RewardImpl>
    implements _$$RewardImplCopyWith<$Res> {
  __$$RewardImplCopyWithImpl(
      _$RewardImpl _value, $Res Function(_$RewardImpl) _then)
      : super(_value, _then);

  /// Create a copy of Reward
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nameKey = null,
    Object? descriptionKey = null,
    Object? imagePath = null,
    Object? type = null,
    Object? unlockCondition = null,
    Object? isUnlocked = null,
    Object? unlockedAt = freezed,
    Object? rarity = null,
  }) {
    return _then(_$RewardImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nameKey: null == nameKey
          ? _value.nameKey
          : nameKey // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionKey: null == descriptionKey
          ? _value.descriptionKey
          : descriptionKey // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      unlockCondition: null == unlockCondition
          ? _value.unlockCondition
          : unlockCondition // ignore: cast_nullable_to_non_nullable
              as String,
      isUnlocked: null == isUnlocked
          ? _value.isUnlocked
          : isUnlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      unlockedAt: freezed == unlockedAt
          ? _value.unlockedAt
          : unlockedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rarity: null == rarity
          ? _value.rarity
          : rarity // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RewardImpl implements _Reward {
  const _$RewardImpl(
      {required this.id,
      required this.nameKey,
      required this.descriptionKey,
      required this.imagePath,
      this.type = 'sticker',
      required this.unlockCondition,
      this.isUnlocked = false,
      this.unlockedAt,
      this.rarity = 'common'});

  factory _$RewardImpl.fromJson(Map<String, dynamic> json) =>
      _$$RewardImplFromJson(json);

  /// Reward ID
  @override
  final String id;

  /// Reward name (localized key)
  @override
  final String nameKey;

  /// Reward description (localized key)
  @override
  final String descriptionKey;

  /// Reward image path
  @override
  final String imagePath;

  /// Reward type (sticker, badge, certificate)
  @override
  @JsonKey()
  final String type;

  /// Unlock condition (lesson completion, test score, etc)
  @override
  final String unlockCondition;

  /// Is unlocked
  @override
  @JsonKey()
  final bool isUnlocked;

  /// Unlock timestamp
  @override
  final DateTime? unlockedAt;

  /// Rarity (common, rare, epic, legendary)
  @override
  @JsonKey()
  final String rarity;

  @override
  String toString() {
    return 'Reward(id: $id, nameKey: $nameKey, descriptionKey: $descriptionKey, imagePath: $imagePath, type: $type, unlockCondition: $unlockCondition, isUnlocked: $isUnlocked, unlockedAt: $unlockedAt, rarity: $rarity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RewardImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nameKey, nameKey) || other.nameKey == nameKey) &&
            (identical(other.descriptionKey, descriptionKey) ||
                other.descriptionKey == descriptionKey) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.unlockCondition, unlockCondition) ||
                other.unlockCondition == unlockCondition) &&
            (identical(other.isUnlocked, isUnlocked) ||
                other.isUnlocked == isUnlocked) &&
            (identical(other.unlockedAt, unlockedAt) ||
                other.unlockedAt == unlockedAt) &&
            (identical(other.rarity, rarity) || other.rarity == rarity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nameKey, descriptionKey,
      imagePath, type, unlockCondition, isUnlocked, unlockedAt, rarity);

  /// Create a copy of Reward
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RewardImplCopyWith<_$RewardImpl> get copyWith =>
      __$$RewardImplCopyWithImpl<_$RewardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RewardImplToJson(
      this,
    );
  }
}

abstract class _Reward implements Reward {
  const factory _Reward(
      {required final String id,
      required final String nameKey,
      required final String descriptionKey,
      required final String imagePath,
      final String type,
      required final String unlockCondition,
      final bool isUnlocked,
      final DateTime? unlockedAt,
      final String rarity}) = _$RewardImpl;

  factory _Reward.fromJson(Map<String, dynamic> json) = _$RewardImpl.fromJson;

  /// Reward ID
  @override
  String get id;

  /// Reward name (localized key)
  @override
  String get nameKey;

  /// Reward description (localized key)
  @override
  String get descriptionKey;

  /// Reward image path
  @override
  String get imagePath;

  /// Reward type (sticker, badge, certificate)
  @override
  String get type;

  /// Unlock condition (lesson completion, test score, etc)
  @override
  String get unlockCondition;

  /// Is unlocked
  @override
  bool get isUnlocked;

  /// Unlock timestamp
  @override
  DateTime? get unlockedAt;

  /// Rarity (common, rare, epic, legendary)
  @override
  String get rarity;

  /// Create a copy of Reward
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RewardImplCopyWith<_$RewardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return _UserProfile.fromJson(json);
}

/// @nodoc
mixin _$UserProfile {
  /// User ID
  String get id => throw _privateConstructorUsedError;

  /// Display name
  String? get displayName => throw _privateConstructorUsedError;

  /// Age
  int? get age => throw _privateConstructorUsedError;

  /// Preferred language
  String get language => throw _privateConstructorUsedError;

  /// Avatar image path
  String? get avatarPath => throw _privateConstructorUsedError;

  /// Total lessons completed
  int get lessonsCompleted => throw _privateConstructorUsedError;

  /// Total rewards unlocked
  int get rewardsUnlocked => throw _privateConstructorUsedError;

  /// Total time spent (seconds)
  int get totalTimeSpent => throw _privateConstructorUsedError;

  /// Registration date
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Last active timestamp
  DateTime? get lastActiveAt => throw _privateConstructorUsedError;

  /// Preferences
  Map<String, dynamic> get preferences => throw _privateConstructorUsedError;

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
      {String id,
      String? displayName,
      int? age,
      String language,
      String? avatarPath,
      int lessonsCompleted,
      int rewardsUnlocked,
      int totalTimeSpent,
      DateTime createdAt,
      DateTime? lastActiveAt,
      Map<String, dynamic> preferences});
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
    Object? displayName = freezed,
    Object? age = freezed,
    Object? language = null,
    Object? avatarPath = freezed,
    Object? lessonsCompleted = null,
    Object? rewardsUnlocked = null,
    Object? totalTimeSpent = null,
    Object? createdAt = null,
    Object? lastActiveAt = freezed,
    Object? preferences = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      avatarPath: freezed == avatarPath
          ? _value.avatarPath
          : avatarPath // ignore: cast_nullable_to_non_nullable
              as String?,
      lessonsCompleted: null == lessonsCompleted
          ? _value.lessonsCompleted
          : lessonsCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      rewardsUnlocked: null == rewardsUnlocked
          ? _value.rewardsUnlocked
          : rewardsUnlocked // ignore: cast_nullable_to_non_nullable
              as int,
      totalTimeSpent: null == totalTimeSpent
          ? _value.totalTimeSpent
          : totalTimeSpent // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastActiveAt: freezed == lastActiveAt
          ? _value.lastActiveAt
          : lastActiveAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      preferences: null == preferences
          ? _value.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
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
      {String id,
      String? displayName,
      int? age,
      String language,
      String? avatarPath,
      int lessonsCompleted,
      int rewardsUnlocked,
      int totalTimeSpent,
      DateTime createdAt,
      DateTime? lastActiveAt,
      Map<String, dynamic> preferences});
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
    Object? displayName = freezed,
    Object? age = freezed,
    Object? language = null,
    Object? avatarPath = freezed,
    Object? lessonsCompleted = null,
    Object? rewardsUnlocked = null,
    Object? totalTimeSpent = null,
    Object? createdAt = null,
    Object? lastActiveAt = freezed,
    Object? preferences = null,
  }) {
    return _then(_$UserProfileImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      avatarPath: freezed == avatarPath
          ? _value.avatarPath
          : avatarPath // ignore: cast_nullable_to_non_nullable
              as String?,
      lessonsCompleted: null == lessonsCompleted
          ? _value.lessonsCompleted
          : lessonsCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      rewardsUnlocked: null == rewardsUnlocked
          ? _value.rewardsUnlocked
          : rewardsUnlocked // ignore: cast_nullable_to_non_nullable
              as int,
      totalTimeSpent: null == totalTimeSpent
          ? _value.totalTimeSpent
          : totalTimeSpent // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastActiveAt: freezed == lastActiveAt
          ? _value.lastActiveAt
          : lastActiveAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      preferences: null == preferences
          ? _value._preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileImpl implements _UserProfile {
  const _$UserProfileImpl(
      {required this.id,
      this.displayName,
      this.age,
      this.language = 'en',
      this.avatarPath,
      this.lessonsCompleted = 0,
      this.rewardsUnlocked = 0,
      this.totalTimeSpent = 0,
      required this.createdAt,
      this.lastActiveAt,
      final Map<String, dynamic> preferences = const {}})
      : _preferences = preferences;

  factory _$UserProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileImplFromJson(json);

  /// User ID
  @override
  final String id;

  /// Display name
  @override
  final String? displayName;

  /// Age
  @override
  final int? age;

  /// Preferred language
  @override
  @JsonKey()
  final String language;

  /// Avatar image path
  @override
  final String? avatarPath;

  /// Total lessons completed
  @override
  @JsonKey()
  final int lessonsCompleted;

  /// Total rewards unlocked
  @override
  @JsonKey()
  final int rewardsUnlocked;

  /// Total time spent (seconds)
  @override
  @JsonKey()
  final int totalTimeSpent;

  /// Registration date
  @override
  final DateTime createdAt;

  /// Last active timestamp
  @override
  final DateTime? lastActiveAt;

  /// Preferences
  final Map<String, dynamic> _preferences;

  /// Preferences
  @override
  @JsonKey()
  Map<String, dynamic> get preferences {
    if (_preferences is EqualUnmodifiableMapView) return _preferences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_preferences);
  }

  @override
  String toString() {
    return 'UserProfile(id: $id, displayName: $displayName, age: $age, language: $language, avatarPath: $avatarPath, lessonsCompleted: $lessonsCompleted, rewardsUnlocked: $rewardsUnlocked, totalTimeSpent: $totalTimeSpent, createdAt: $createdAt, lastActiveAt: $lastActiveAt, preferences: $preferences)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.avatarPath, avatarPath) ||
                other.avatarPath == avatarPath) &&
            (identical(other.lessonsCompleted, lessonsCompleted) ||
                other.lessonsCompleted == lessonsCompleted) &&
            (identical(other.rewardsUnlocked, rewardsUnlocked) ||
                other.rewardsUnlocked == rewardsUnlocked) &&
            (identical(other.totalTimeSpent, totalTimeSpent) ||
                other.totalTimeSpent == totalTimeSpent) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastActiveAt, lastActiveAt) ||
                other.lastActiveAt == lastActiveAt) &&
            const DeepCollectionEquality()
                .equals(other._preferences, _preferences));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      displayName,
      age,
      language,
      avatarPath,
      lessonsCompleted,
      rewardsUnlocked,
      totalTimeSpent,
      createdAt,
      lastActiveAt,
      const DeepCollectionEquality().hash(_preferences));

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
      {required final String id,
      final String? displayName,
      final int? age,
      final String language,
      final String? avatarPath,
      final int lessonsCompleted,
      final int rewardsUnlocked,
      final int totalTimeSpent,
      required final DateTime createdAt,
      final DateTime? lastActiveAt,
      final Map<String, dynamic> preferences}) = _$UserProfileImpl;

  factory _UserProfile.fromJson(Map<String, dynamic> json) =
      _$UserProfileImpl.fromJson;

  /// User ID
  @override
  String get id;

  /// Display name
  @override
  String? get displayName;

  /// Age
  @override
  int? get age;

  /// Preferred language
  @override
  String get language;

  /// Avatar image path
  @override
  String? get avatarPath;

  /// Total lessons completed
  @override
  int get lessonsCompleted;

  /// Total rewards unlocked
  @override
  int get rewardsUnlocked;

  /// Total time spent (seconds)
  @override
  int get totalTimeSpent;

  /// Registration date
  @override
  DateTime get createdAt;

  /// Last active timestamp
  @override
  DateTime? get lastActiveAt;

  /// Preferences
  @override
  Map<String, dynamic> get preferences;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
