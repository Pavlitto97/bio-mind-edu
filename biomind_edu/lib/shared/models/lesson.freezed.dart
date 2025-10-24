// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Lesson _$LessonFromJson(Map<String, dynamic> json) {
  return _Lesson.fromJson(json);
}

/// @nodoc
mixin _$Lesson {
  /// Unique lesson identifier
  String get id => throw _privateConstructorUsedError;

  /// Lesson title (localized key)
  String get titleKey => throw _privateConstructorUsedError;

  /// Lesson description (localized key)
  String get descriptionKey => throw _privateConstructorUsedError;

  /// Difficulty level
  LessonDifficulty get difficulty => throw _privateConstructorUsedError;

  /// 3D model file name
  String get modelFileName => throw _privateConstructorUsedError;

  /// Voice instruction audio files by locale
  Map<String, List<String>> get voiceFiles =>
      throw _privateConstructorUsedError;

  /// Interactive task ID
  String get interactiveTaskId => throw _privateConstructorUsedError;

  /// Assessment test ID
  String get assessmentTestId => throw _privateConstructorUsedError;

  /// Reward ID to unlock upon completion
  String get rewardId => throw _privateConstructorUsedError;

  /// Lesson order in the curriculum
  int get order => throw _privateConstructorUsedError;

  /// Estimated duration in minutes
  int get durationMinutes => throw _privateConstructorUsedError;

  /// Required previous lessons (dependencies)
  List<String> get prerequisites => throw _privateConstructorUsedError;

  /// AR scene annotations
  List<LessonAnnotation> get annotations => throw _privateConstructorUsedError;

  /// Thumbnail image path
  String? get thumbnailPath => throw _privateConstructorUsedError;

  /// Is lesson locked (requires prerequisites)
  bool get isLocked => throw _privateConstructorUsedError;

  /// Completion status
  LessonStatus get status => throw _privateConstructorUsedError;

  /// Serializes this Lesson to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Lesson
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LessonCopyWith<Lesson> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonCopyWith<$Res> {
  factory $LessonCopyWith(Lesson value, $Res Function(Lesson) then) =
      _$LessonCopyWithImpl<$Res, Lesson>;
  @useResult
  $Res call(
      {String id,
      String titleKey,
      String descriptionKey,
      LessonDifficulty difficulty,
      String modelFileName,
      Map<String, List<String>> voiceFiles,
      String interactiveTaskId,
      String assessmentTestId,
      String rewardId,
      int order,
      int durationMinutes,
      List<String> prerequisites,
      List<LessonAnnotation> annotations,
      String? thumbnailPath,
      bool isLocked,
      LessonStatus status});
}

/// @nodoc
class _$LessonCopyWithImpl<$Res, $Val extends Lesson>
    implements $LessonCopyWith<$Res> {
  _$LessonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Lesson
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? titleKey = null,
    Object? descriptionKey = null,
    Object? difficulty = null,
    Object? modelFileName = null,
    Object? voiceFiles = null,
    Object? interactiveTaskId = null,
    Object? assessmentTestId = null,
    Object? rewardId = null,
    Object? order = null,
    Object? durationMinutes = null,
    Object? prerequisites = null,
    Object? annotations = null,
    Object? thumbnailPath = freezed,
    Object? isLocked = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      titleKey: null == titleKey
          ? _value.titleKey
          : titleKey // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionKey: null == descriptionKey
          ? _value.descriptionKey
          : descriptionKey // ignore: cast_nullable_to_non_nullable
              as String,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as LessonDifficulty,
      modelFileName: null == modelFileName
          ? _value.modelFileName
          : modelFileName // ignore: cast_nullable_to_non_nullable
              as String,
      voiceFiles: null == voiceFiles
          ? _value.voiceFiles
          : voiceFiles // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
      interactiveTaskId: null == interactiveTaskId
          ? _value.interactiveTaskId
          : interactiveTaskId // ignore: cast_nullable_to_non_nullable
              as String,
      assessmentTestId: null == assessmentTestId
          ? _value.assessmentTestId
          : assessmentTestId // ignore: cast_nullable_to_non_nullable
              as String,
      rewardId: null == rewardId
          ? _value.rewardId
          : rewardId // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      durationMinutes: null == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      prerequisites: null == prerequisites
          ? _value.prerequisites
          : prerequisites // ignore: cast_nullable_to_non_nullable
              as List<String>,
      annotations: null == annotations
          ? _value.annotations
          : annotations // ignore: cast_nullable_to_non_nullable
              as List<LessonAnnotation>,
      thumbnailPath: freezed == thumbnailPath
          ? _value.thumbnailPath
          : thumbnailPath // ignore: cast_nullable_to_non_nullable
              as String?,
      isLocked: null == isLocked
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LessonStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LessonImplCopyWith<$Res> implements $LessonCopyWith<$Res> {
  factory _$$LessonImplCopyWith(
          _$LessonImpl value, $Res Function(_$LessonImpl) then) =
      __$$LessonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String titleKey,
      String descriptionKey,
      LessonDifficulty difficulty,
      String modelFileName,
      Map<String, List<String>> voiceFiles,
      String interactiveTaskId,
      String assessmentTestId,
      String rewardId,
      int order,
      int durationMinutes,
      List<String> prerequisites,
      List<LessonAnnotation> annotations,
      String? thumbnailPath,
      bool isLocked,
      LessonStatus status});
}

/// @nodoc
class __$$LessonImplCopyWithImpl<$Res>
    extends _$LessonCopyWithImpl<$Res, _$LessonImpl>
    implements _$$LessonImplCopyWith<$Res> {
  __$$LessonImplCopyWithImpl(
      _$LessonImpl _value, $Res Function(_$LessonImpl) _then)
      : super(_value, _then);

  /// Create a copy of Lesson
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? titleKey = null,
    Object? descriptionKey = null,
    Object? difficulty = null,
    Object? modelFileName = null,
    Object? voiceFiles = null,
    Object? interactiveTaskId = null,
    Object? assessmentTestId = null,
    Object? rewardId = null,
    Object? order = null,
    Object? durationMinutes = null,
    Object? prerequisites = null,
    Object? annotations = null,
    Object? thumbnailPath = freezed,
    Object? isLocked = null,
    Object? status = null,
  }) {
    return _then(_$LessonImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      titleKey: null == titleKey
          ? _value.titleKey
          : titleKey // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionKey: null == descriptionKey
          ? _value.descriptionKey
          : descriptionKey // ignore: cast_nullable_to_non_nullable
              as String,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as LessonDifficulty,
      modelFileName: null == modelFileName
          ? _value.modelFileName
          : modelFileName // ignore: cast_nullable_to_non_nullable
              as String,
      voiceFiles: null == voiceFiles
          ? _value._voiceFiles
          : voiceFiles // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
      interactiveTaskId: null == interactiveTaskId
          ? _value.interactiveTaskId
          : interactiveTaskId // ignore: cast_nullable_to_non_nullable
              as String,
      assessmentTestId: null == assessmentTestId
          ? _value.assessmentTestId
          : assessmentTestId // ignore: cast_nullable_to_non_nullable
              as String,
      rewardId: null == rewardId
          ? _value.rewardId
          : rewardId // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      durationMinutes: null == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      prerequisites: null == prerequisites
          ? _value._prerequisites
          : prerequisites // ignore: cast_nullable_to_non_nullable
              as List<String>,
      annotations: null == annotations
          ? _value._annotations
          : annotations // ignore: cast_nullable_to_non_nullable
              as List<LessonAnnotation>,
      thumbnailPath: freezed == thumbnailPath
          ? _value.thumbnailPath
          : thumbnailPath // ignore: cast_nullable_to_non_nullable
              as String?,
      isLocked: null == isLocked
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LessonStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LessonImpl implements _Lesson {
  const _$LessonImpl(
      {required this.id,
      required this.titleKey,
      required this.descriptionKey,
      required this.difficulty,
      required this.modelFileName,
      required final Map<String, List<String>> voiceFiles,
      required this.interactiveTaskId,
      required this.assessmentTestId,
      required this.rewardId,
      required this.order,
      required this.durationMinutes,
      final List<String> prerequisites = const [],
      final List<LessonAnnotation> annotations = const [],
      this.thumbnailPath,
      this.isLocked = false,
      this.status = LessonStatus.notStarted})
      : _voiceFiles = voiceFiles,
        _prerequisites = prerequisites,
        _annotations = annotations;

  factory _$LessonImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonImplFromJson(json);

  /// Unique lesson identifier
  @override
  final String id;

  /// Lesson title (localized key)
  @override
  final String titleKey;

  /// Lesson description (localized key)
  @override
  final String descriptionKey;

  /// Difficulty level
  @override
  final LessonDifficulty difficulty;

  /// 3D model file name
  @override
  final String modelFileName;

  /// Voice instruction audio files by locale
  final Map<String, List<String>> _voiceFiles;

  /// Voice instruction audio files by locale
  @override
  Map<String, List<String>> get voiceFiles {
    if (_voiceFiles is EqualUnmodifiableMapView) return _voiceFiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_voiceFiles);
  }

  /// Interactive task ID
  @override
  final String interactiveTaskId;

  /// Assessment test ID
  @override
  final String assessmentTestId;

  /// Reward ID to unlock upon completion
  @override
  final String rewardId;

  /// Lesson order in the curriculum
  @override
  final int order;

  /// Estimated duration in minutes
  @override
  final int durationMinutes;

  /// Required previous lessons (dependencies)
  final List<String> _prerequisites;

  /// Required previous lessons (dependencies)
  @override
  @JsonKey()
  List<String> get prerequisites {
    if (_prerequisites is EqualUnmodifiableListView) return _prerequisites;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_prerequisites);
  }

  /// AR scene annotations
  final List<LessonAnnotation> _annotations;

  /// AR scene annotations
  @override
  @JsonKey()
  List<LessonAnnotation> get annotations {
    if (_annotations is EqualUnmodifiableListView) return _annotations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_annotations);
  }

  /// Thumbnail image path
  @override
  final String? thumbnailPath;

  /// Is lesson locked (requires prerequisites)
  @override
  @JsonKey()
  final bool isLocked;

  /// Completion status
  @override
  @JsonKey()
  final LessonStatus status;

  @override
  String toString() {
    return 'Lesson(id: $id, titleKey: $titleKey, descriptionKey: $descriptionKey, difficulty: $difficulty, modelFileName: $modelFileName, voiceFiles: $voiceFiles, interactiveTaskId: $interactiveTaskId, assessmentTestId: $assessmentTestId, rewardId: $rewardId, order: $order, durationMinutes: $durationMinutes, prerequisites: $prerequisites, annotations: $annotations, thumbnailPath: $thumbnailPath, isLocked: $isLocked, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.titleKey, titleKey) ||
                other.titleKey == titleKey) &&
            (identical(other.descriptionKey, descriptionKey) ||
                other.descriptionKey == descriptionKey) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.modelFileName, modelFileName) ||
                other.modelFileName == modelFileName) &&
            const DeepCollectionEquality()
                .equals(other._voiceFiles, _voiceFiles) &&
            (identical(other.interactiveTaskId, interactiveTaskId) ||
                other.interactiveTaskId == interactiveTaskId) &&
            (identical(other.assessmentTestId, assessmentTestId) ||
                other.assessmentTestId == assessmentTestId) &&
            (identical(other.rewardId, rewardId) ||
                other.rewardId == rewardId) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            const DeepCollectionEquality()
                .equals(other._prerequisites, _prerequisites) &&
            const DeepCollectionEquality()
                .equals(other._annotations, _annotations) &&
            (identical(other.thumbnailPath, thumbnailPath) ||
                other.thumbnailPath == thumbnailPath) &&
            (identical(other.isLocked, isLocked) ||
                other.isLocked == isLocked) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      titleKey,
      descriptionKey,
      difficulty,
      modelFileName,
      const DeepCollectionEquality().hash(_voiceFiles),
      interactiveTaskId,
      assessmentTestId,
      rewardId,
      order,
      durationMinutes,
      const DeepCollectionEquality().hash(_prerequisites),
      const DeepCollectionEquality().hash(_annotations),
      thumbnailPath,
      isLocked,
      status);

  /// Create a copy of Lesson
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonImplCopyWith<_$LessonImpl> get copyWith =>
      __$$LessonImplCopyWithImpl<_$LessonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonImplToJson(
      this,
    );
  }
}

abstract class _Lesson implements Lesson {
  const factory _Lesson(
      {required final String id,
      required final String titleKey,
      required final String descriptionKey,
      required final LessonDifficulty difficulty,
      required final String modelFileName,
      required final Map<String, List<String>> voiceFiles,
      required final String interactiveTaskId,
      required final String assessmentTestId,
      required final String rewardId,
      required final int order,
      required final int durationMinutes,
      final List<String> prerequisites,
      final List<LessonAnnotation> annotations,
      final String? thumbnailPath,
      final bool isLocked,
      final LessonStatus status}) = _$LessonImpl;

  factory _Lesson.fromJson(Map<String, dynamic> json) = _$LessonImpl.fromJson;

  /// Unique lesson identifier
  @override
  String get id;

  /// Lesson title (localized key)
  @override
  String get titleKey;

  /// Lesson description (localized key)
  @override
  String get descriptionKey;

  /// Difficulty level
  @override
  LessonDifficulty get difficulty;

  /// 3D model file name
  @override
  String get modelFileName;

  /// Voice instruction audio files by locale
  @override
  Map<String, List<String>> get voiceFiles;

  /// Interactive task ID
  @override
  String get interactiveTaskId;

  /// Assessment test ID
  @override
  String get assessmentTestId;

  /// Reward ID to unlock upon completion
  @override
  String get rewardId;

  /// Lesson order in the curriculum
  @override
  int get order;

  /// Estimated duration in minutes
  @override
  int get durationMinutes;

  /// Required previous lessons (dependencies)
  @override
  List<String> get prerequisites;

  /// AR scene annotations
  @override
  List<LessonAnnotation> get annotations;

  /// Thumbnail image path
  @override
  String? get thumbnailPath;

  /// Is lesson locked (requires prerequisites)
  @override
  bool get isLocked;

  /// Completion status
  @override
  LessonStatus get status;

  /// Create a copy of Lesson
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LessonImplCopyWith<_$LessonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LessonAnnotation _$LessonAnnotationFromJson(Map<String, dynamic> json) {
  return _LessonAnnotation.fromJson(json);
}

/// @nodoc
mixin _$LessonAnnotation {
  /// Annotation ID
  String get id => throw _privateConstructorUsedError;

  /// Part name (localized key)
  String get nameKey => throw _privateConstructorUsedError;

  /// Part description (localized key)
  String get descriptionKey => throw _privateConstructorUsedError;

  /// 3D model part identifier
  String get modelPartId => throw _privateConstructorUsedError;

  /// Voice explanation audio file
  String? get voiceFile => throw _privateConstructorUsedError;

  /// Position in 3D space (x, y, z)
  List<double> get position => throw _privateConstructorUsedError;

  /// Serializes this LessonAnnotation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LessonAnnotation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LessonAnnotationCopyWith<LessonAnnotation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonAnnotationCopyWith<$Res> {
  factory $LessonAnnotationCopyWith(
          LessonAnnotation value, $Res Function(LessonAnnotation) then) =
      _$LessonAnnotationCopyWithImpl<$Res, LessonAnnotation>;
  @useResult
  $Res call(
      {String id,
      String nameKey,
      String descriptionKey,
      String modelPartId,
      String? voiceFile,
      List<double> position});
}

/// @nodoc
class _$LessonAnnotationCopyWithImpl<$Res, $Val extends LessonAnnotation>
    implements $LessonAnnotationCopyWith<$Res> {
  _$LessonAnnotationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LessonAnnotation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nameKey = null,
    Object? descriptionKey = null,
    Object? modelPartId = null,
    Object? voiceFile = freezed,
    Object? position = null,
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
      modelPartId: null == modelPartId
          ? _value.modelPartId
          : modelPartId // ignore: cast_nullable_to_non_nullable
              as String,
      voiceFile: freezed == voiceFile
          ? _value.voiceFile
          : voiceFile // ignore: cast_nullable_to_non_nullable
              as String?,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LessonAnnotationImplCopyWith<$Res>
    implements $LessonAnnotationCopyWith<$Res> {
  factory _$$LessonAnnotationImplCopyWith(_$LessonAnnotationImpl value,
          $Res Function(_$LessonAnnotationImpl) then) =
      __$$LessonAnnotationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String nameKey,
      String descriptionKey,
      String modelPartId,
      String? voiceFile,
      List<double> position});
}

/// @nodoc
class __$$LessonAnnotationImplCopyWithImpl<$Res>
    extends _$LessonAnnotationCopyWithImpl<$Res, _$LessonAnnotationImpl>
    implements _$$LessonAnnotationImplCopyWith<$Res> {
  __$$LessonAnnotationImplCopyWithImpl(_$LessonAnnotationImpl _value,
      $Res Function(_$LessonAnnotationImpl) _then)
      : super(_value, _then);

  /// Create a copy of LessonAnnotation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nameKey = null,
    Object? descriptionKey = null,
    Object? modelPartId = null,
    Object? voiceFile = freezed,
    Object? position = null,
  }) {
    return _then(_$LessonAnnotationImpl(
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
      modelPartId: null == modelPartId
          ? _value.modelPartId
          : modelPartId // ignore: cast_nullable_to_non_nullable
              as String,
      voiceFile: freezed == voiceFile
          ? _value.voiceFile
          : voiceFile // ignore: cast_nullable_to_non_nullable
              as String?,
      position: null == position
          ? _value._position
          : position // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LessonAnnotationImpl implements _LessonAnnotation {
  const _$LessonAnnotationImpl(
      {required this.id,
      required this.nameKey,
      required this.descriptionKey,
      required this.modelPartId,
      this.voiceFile,
      final List<double> position = const [0.0, 0.0, 0.0]})
      : _position = position;

  factory _$LessonAnnotationImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonAnnotationImplFromJson(json);

  /// Annotation ID
  @override
  final String id;

  /// Part name (localized key)
  @override
  final String nameKey;

  /// Part description (localized key)
  @override
  final String descriptionKey;

  /// 3D model part identifier
  @override
  final String modelPartId;

  /// Voice explanation audio file
  @override
  final String? voiceFile;

  /// Position in 3D space (x, y, z)
  final List<double> _position;

  /// Position in 3D space (x, y, z)
  @override
  @JsonKey()
  List<double> get position {
    if (_position is EqualUnmodifiableListView) return _position;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_position);
  }

  @override
  String toString() {
    return 'LessonAnnotation(id: $id, nameKey: $nameKey, descriptionKey: $descriptionKey, modelPartId: $modelPartId, voiceFile: $voiceFile, position: $position)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonAnnotationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nameKey, nameKey) || other.nameKey == nameKey) &&
            (identical(other.descriptionKey, descriptionKey) ||
                other.descriptionKey == descriptionKey) &&
            (identical(other.modelPartId, modelPartId) ||
                other.modelPartId == modelPartId) &&
            (identical(other.voiceFile, voiceFile) ||
                other.voiceFile == voiceFile) &&
            const DeepCollectionEquality().equals(other._position, _position));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nameKey, descriptionKey,
      modelPartId, voiceFile, const DeepCollectionEquality().hash(_position));

  /// Create a copy of LessonAnnotation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonAnnotationImplCopyWith<_$LessonAnnotationImpl> get copyWith =>
      __$$LessonAnnotationImplCopyWithImpl<_$LessonAnnotationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonAnnotationImplToJson(
      this,
    );
  }
}

abstract class _LessonAnnotation implements LessonAnnotation {
  const factory _LessonAnnotation(
      {required final String id,
      required final String nameKey,
      required final String descriptionKey,
      required final String modelPartId,
      final String? voiceFile,
      final List<double> position}) = _$LessonAnnotationImpl;

  factory _LessonAnnotation.fromJson(Map<String, dynamic> json) =
      _$LessonAnnotationImpl.fromJson;

  /// Annotation ID
  @override
  String get id;

  /// Part name (localized key)
  @override
  String get nameKey;

  /// Part description (localized key)
  @override
  String get descriptionKey;

  /// 3D model part identifier
  @override
  String get modelPartId;

  /// Voice explanation audio file
  @override
  String? get voiceFile;

  /// Position in 3D space (x, y, z)
  @override
  List<double> get position;

  /// Create a copy of LessonAnnotation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LessonAnnotationImplCopyWith<_$LessonAnnotationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
