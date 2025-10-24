// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'interactive_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InteractiveTask _$InteractiveTaskFromJson(Map<String, dynamic> json) {
  return _InteractiveTask.fromJson(json);
}

/// @nodoc
mixin _$InteractiveTask {
  /// Task ID
  String get id => throw _privateConstructorUsedError;

  /// Task title (localized key)
  String get titleKey => throw _privateConstructorUsedError;

  /// Task instruction (localized key)
  String get instructionKey => throw _privateConstructorUsedError;

  /// Task type
  TaskType get type => throw _privateConstructorUsedError;

  /// Task items (draggable elements)
  List<TaskItem> get items => throw _privateConstructorUsedError;

  /// Target zones (drop zones)
  List<TaskTarget> get targets => throw _privateConstructorUsedError;

  /// Correct matches (itemId -> targetId)
  Map<String, String> get correctMatches => throw _privateConstructorUsedError;

  /// Success voice file
  String? get successVoiceFile => throw _privateConstructorUsedError;

  /// Error voice file
  String? get errorVoiceFile => throw _privateConstructorUsedError;

  /// Hint voice file
  String? get hintVoiceFile => throw _privateConstructorUsedError;

  /// Time limit in seconds (null = no limit)
  int? get timeLimitSeconds => throw _privateConstructorUsedError;

  /// Minimum correct answers to pass
  int get minCorrectToPass => throw _privateConstructorUsedError;

  /// Serializes this InteractiveTask to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InteractiveTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InteractiveTaskCopyWith<InteractiveTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InteractiveTaskCopyWith<$Res> {
  factory $InteractiveTaskCopyWith(
          InteractiveTask value, $Res Function(InteractiveTask) then) =
      _$InteractiveTaskCopyWithImpl<$Res, InteractiveTask>;
  @useResult
  $Res call(
      {String id,
      String titleKey,
      String instructionKey,
      TaskType type,
      List<TaskItem> items,
      List<TaskTarget> targets,
      Map<String, String> correctMatches,
      String? successVoiceFile,
      String? errorVoiceFile,
      String? hintVoiceFile,
      int? timeLimitSeconds,
      int minCorrectToPass});
}

/// @nodoc
class _$InteractiveTaskCopyWithImpl<$Res, $Val extends InteractiveTask>
    implements $InteractiveTaskCopyWith<$Res> {
  _$InteractiveTaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InteractiveTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? titleKey = null,
    Object? instructionKey = null,
    Object? type = null,
    Object? items = null,
    Object? targets = null,
    Object? correctMatches = null,
    Object? successVoiceFile = freezed,
    Object? errorVoiceFile = freezed,
    Object? hintVoiceFile = freezed,
    Object? timeLimitSeconds = freezed,
    Object? minCorrectToPass = null,
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
      instructionKey: null == instructionKey
          ? _value.instructionKey
          : instructionKey // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TaskType,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<TaskItem>,
      targets: null == targets
          ? _value.targets
          : targets // ignore: cast_nullable_to_non_nullable
              as List<TaskTarget>,
      correctMatches: null == correctMatches
          ? _value.correctMatches
          : correctMatches // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      successVoiceFile: freezed == successVoiceFile
          ? _value.successVoiceFile
          : successVoiceFile // ignore: cast_nullable_to_non_nullable
              as String?,
      errorVoiceFile: freezed == errorVoiceFile
          ? _value.errorVoiceFile
          : errorVoiceFile // ignore: cast_nullable_to_non_nullable
              as String?,
      hintVoiceFile: freezed == hintVoiceFile
          ? _value.hintVoiceFile
          : hintVoiceFile // ignore: cast_nullable_to_non_nullable
              as String?,
      timeLimitSeconds: freezed == timeLimitSeconds
          ? _value.timeLimitSeconds
          : timeLimitSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      minCorrectToPass: null == minCorrectToPass
          ? _value.minCorrectToPass
          : minCorrectToPass // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InteractiveTaskImplCopyWith<$Res>
    implements $InteractiveTaskCopyWith<$Res> {
  factory _$$InteractiveTaskImplCopyWith(_$InteractiveTaskImpl value,
          $Res Function(_$InteractiveTaskImpl) then) =
      __$$InteractiveTaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String titleKey,
      String instructionKey,
      TaskType type,
      List<TaskItem> items,
      List<TaskTarget> targets,
      Map<String, String> correctMatches,
      String? successVoiceFile,
      String? errorVoiceFile,
      String? hintVoiceFile,
      int? timeLimitSeconds,
      int minCorrectToPass});
}

/// @nodoc
class __$$InteractiveTaskImplCopyWithImpl<$Res>
    extends _$InteractiveTaskCopyWithImpl<$Res, _$InteractiveTaskImpl>
    implements _$$InteractiveTaskImplCopyWith<$Res> {
  __$$InteractiveTaskImplCopyWithImpl(
      _$InteractiveTaskImpl _value, $Res Function(_$InteractiveTaskImpl) _then)
      : super(_value, _then);

  /// Create a copy of InteractiveTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? titleKey = null,
    Object? instructionKey = null,
    Object? type = null,
    Object? items = null,
    Object? targets = null,
    Object? correctMatches = null,
    Object? successVoiceFile = freezed,
    Object? errorVoiceFile = freezed,
    Object? hintVoiceFile = freezed,
    Object? timeLimitSeconds = freezed,
    Object? minCorrectToPass = null,
  }) {
    return _then(_$InteractiveTaskImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      titleKey: null == titleKey
          ? _value.titleKey
          : titleKey // ignore: cast_nullable_to_non_nullable
              as String,
      instructionKey: null == instructionKey
          ? _value.instructionKey
          : instructionKey // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TaskType,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<TaskItem>,
      targets: null == targets
          ? _value._targets
          : targets // ignore: cast_nullable_to_non_nullable
              as List<TaskTarget>,
      correctMatches: null == correctMatches
          ? _value._correctMatches
          : correctMatches // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      successVoiceFile: freezed == successVoiceFile
          ? _value.successVoiceFile
          : successVoiceFile // ignore: cast_nullable_to_non_nullable
              as String?,
      errorVoiceFile: freezed == errorVoiceFile
          ? _value.errorVoiceFile
          : errorVoiceFile // ignore: cast_nullable_to_non_nullable
              as String?,
      hintVoiceFile: freezed == hintVoiceFile
          ? _value.hintVoiceFile
          : hintVoiceFile // ignore: cast_nullable_to_non_nullable
              as String?,
      timeLimitSeconds: freezed == timeLimitSeconds
          ? _value.timeLimitSeconds
          : timeLimitSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      minCorrectToPass: null == minCorrectToPass
          ? _value.minCorrectToPass
          : minCorrectToPass // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InteractiveTaskImpl implements _InteractiveTask {
  const _$InteractiveTaskImpl(
      {required this.id,
      required this.titleKey,
      required this.instructionKey,
      required this.type,
      required final List<TaskItem> items,
      required final List<TaskTarget> targets,
      required final Map<String, String> correctMatches,
      this.successVoiceFile,
      this.errorVoiceFile,
      this.hintVoiceFile,
      this.timeLimitSeconds,
      this.minCorrectToPass = 1})
      : _items = items,
        _targets = targets,
        _correctMatches = correctMatches;

  factory _$InteractiveTaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$InteractiveTaskImplFromJson(json);

  /// Task ID
  @override
  final String id;

  /// Task title (localized key)
  @override
  final String titleKey;

  /// Task instruction (localized key)
  @override
  final String instructionKey;

  /// Task type
  @override
  final TaskType type;

  /// Task items (draggable elements)
  final List<TaskItem> _items;

  /// Task items (draggable elements)
  @override
  List<TaskItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  /// Target zones (drop zones)
  final List<TaskTarget> _targets;

  /// Target zones (drop zones)
  @override
  List<TaskTarget> get targets {
    if (_targets is EqualUnmodifiableListView) return _targets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_targets);
  }

  /// Correct matches (itemId -> targetId)
  final Map<String, String> _correctMatches;

  /// Correct matches (itemId -> targetId)
  @override
  Map<String, String> get correctMatches {
    if (_correctMatches is EqualUnmodifiableMapView) return _correctMatches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_correctMatches);
  }

  /// Success voice file
  @override
  final String? successVoiceFile;

  /// Error voice file
  @override
  final String? errorVoiceFile;

  /// Hint voice file
  @override
  final String? hintVoiceFile;

  /// Time limit in seconds (null = no limit)
  @override
  final int? timeLimitSeconds;

  /// Minimum correct answers to pass
  @override
  @JsonKey()
  final int minCorrectToPass;

  @override
  String toString() {
    return 'InteractiveTask(id: $id, titleKey: $titleKey, instructionKey: $instructionKey, type: $type, items: $items, targets: $targets, correctMatches: $correctMatches, successVoiceFile: $successVoiceFile, errorVoiceFile: $errorVoiceFile, hintVoiceFile: $hintVoiceFile, timeLimitSeconds: $timeLimitSeconds, minCorrectToPass: $minCorrectToPass)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InteractiveTaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.titleKey, titleKey) ||
                other.titleKey == titleKey) &&
            (identical(other.instructionKey, instructionKey) ||
                other.instructionKey == instructionKey) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality().equals(other._targets, _targets) &&
            const DeepCollectionEquality()
                .equals(other._correctMatches, _correctMatches) &&
            (identical(other.successVoiceFile, successVoiceFile) ||
                other.successVoiceFile == successVoiceFile) &&
            (identical(other.errorVoiceFile, errorVoiceFile) ||
                other.errorVoiceFile == errorVoiceFile) &&
            (identical(other.hintVoiceFile, hintVoiceFile) ||
                other.hintVoiceFile == hintVoiceFile) &&
            (identical(other.timeLimitSeconds, timeLimitSeconds) ||
                other.timeLimitSeconds == timeLimitSeconds) &&
            (identical(other.minCorrectToPass, minCorrectToPass) ||
                other.minCorrectToPass == minCorrectToPass));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      titleKey,
      instructionKey,
      type,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(_targets),
      const DeepCollectionEquality().hash(_correctMatches),
      successVoiceFile,
      errorVoiceFile,
      hintVoiceFile,
      timeLimitSeconds,
      minCorrectToPass);

  /// Create a copy of InteractiveTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InteractiveTaskImplCopyWith<_$InteractiveTaskImpl> get copyWith =>
      __$$InteractiveTaskImplCopyWithImpl<_$InteractiveTaskImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InteractiveTaskImplToJson(
      this,
    );
  }
}

abstract class _InteractiveTask implements InteractiveTask {
  const factory _InteractiveTask(
      {required final String id,
      required final String titleKey,
      required final String instructionKey,
      required final TaskType type,
      required final List<TaskItem> items,
      required final List<TaskTarget> targets,
      required final Map<String, String> correctMatches,
      final String? successVoiceFile,
      final String? errorVoiceFile,
      final String? hintVoiceFile,
      final int? timeLimitSeconds,
      final int minCorrectToPass}) = _$InteractiveTaskImpl;

  factory _InteractiveTask.fromJson(Map<String, dynamic> json) =
      _$InteractiveTaskImpl.fromJson;

  /// Task ID
  @override
  String get id;

  /// Task title (localized key)
  @override
  String get titleKey;

  /// Task instruction (localized key)
  @override
  String get instructionKey;

  /// Task type
  @override
  TaskType get type;

  /// Task items (draggable elements)
  @override
  List<TaskItem> get items;

  /// Target zones (drop zones)
  @override
  List<TaskTarget> get targets;

  /// Correct matches (itemId -> targetId)
  @override
  Map<String, String> get correctMatches;

  /// Success voice file
  @override
  String? get successVoiceFile;

  /// Error voice file
  @override
  String? get errorVoiceFile;

  /// Hint voice file
  @override
  String? get hintVoiceFile;

  /// Time limit in seconds (null = no limit)
  @override
  int? get timeLimitSeconds;

  /// Minimum correct answers to pass
  @override
  int get minCorrectToPass;

  /// Create a copy of InteractiveTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InteractiveTaskImplCopyWith<_$InteractiveTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TaskItem _$TaskItemFromJson(Map<String, dynamic> json) {
  return _TaskItem.fromJson(json);
}

/// @nodoc
mixin _$TaskItem {
  /// Item ID
  String get id => throw _privateConstructorUsedError;

  /// Item label (localized key)
  String get labelKey => throw _privateConstructorUsedError;

  /// Item image path
  String? get imagePath => throw _privateConstructorUsedError;

  /// Item icon name
  String? get iconName => throw _privateConstructorUsedError;

  /// Item color (hex)
  String? get color => throw _privateConstructorUsedError;

  /// Initial position (x, y)
  List<double> get initialPosition => throw _privateConstructorUsedError;

  /// Serializes this TaskItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaskItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskItemCopyWith<TaskItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskItemCopyWith<$Res> {
  factory $TaskItemCopyWith(TaskItem value, $Res Function(TaskItem) then) =
      _$TaskItemCopyWithImpl<$Res, TaskItem>;
  @useResult
  $Res call(
      {String id,
      String labelKey,
      String? imagePath,
      String? iconName,
      String? color,
      List<double> initialPosition});
}

/// @nodoc
class _$TaskItemCopyWithImpl<$Res, $Val extends TaskItem>
    implements $TaskItemCopyWith<$Res> {
  _$TaskItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? labelKey = null,
    Object? imagePath = freezed,
    Object? iconName = freezed,
    Object? color = freezed,
    Object? initialPosition = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      labelKey: null == labelKey
          ? _value.labelKey
          : labelKey // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      iconName: freezed == iconName
          ? _value.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      initialPosition: null == initialPosition
          ? _value.initialPosition
          : initialPosition // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskItemImplCopyWith<$Res>
    implements $TaskItemCopyWith<$Res> {
  factory _$$TaskItemImplCopyWith(
          _$TaskItemImpl value, $Res Function(_$TaskItemImpl) then) =
      __$$TaskItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String labelKey,
      String? imagePath,
      String? iconName,
      String? color,
      List<double> initialPosition});
}

/// @nodoc
class __$$TaskItemImplCopyWithImpl<$Res>
    extends _$TaskItemCopyWithImpl<$Res, _$TaskItemImpl>
    implements _$$TaskItemImplCopyWith<$Res> {
  __$$TaskItemImplCopyWithImpl(
      _$TaskItemImpl _value, $Res Function(_$TaskItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? labelKey = null,
    Object? imagePath = freezed,
    Object? iconName = freezed,
    Object? color = freezed,
    Object? initialPosition = null,
  }) {
    return _then(_$TaskItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      labelKey: null == labelKey
          ? _value.labelKey
          : labelKey // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      iconName: freezed == iconName
          ? _value.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      initialPosition: null == initialPosition
          ? _value._initialPosition
          : initialPosition // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskItemImpl implements _TaskItem {
  const _$TaskItemImpl(
      {required this.id,
      required this.labelKey,
      this.imagePath,
      this.iconName,
      this.color,
      final List<double> initialPosition = const [0.0, 0.0]})
      : _initialPosition = initialPosition;

  factory _$TaskItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskItemImplFromJson(json);

  /// Item ID
  @override
  final String id;

  /// Item label (localized key)
  @override
  final String labelKey;

  /// Item image path
  @override
  final String? imagePath;

  /// Item icon name
  @override
  final String? iconName;

  /// Item color (hex)
  @override
  final String? color;

  /// Initial position (x, y)
  final List<double> _initialPosition;

  /// Initial position (x, y)
  @override
  @JsonKey()
  List<double> get initialPosition {
    if (_initialPosition is EqualUnmodifiableListView) return _initialPosition;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_initialPosition);
  }

  @override
  String toString() {
    return 'TaskItem(id: $id, labelKey: $labelKey, imagePath: $imagePath, iconName: $iconName, color: $color, initialPosition: $initialPosition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.labelKey, labelKey) ||
                other.labelKey == labelKey) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.iconName, iconName) ||
                other.iconName == iconName) &&
            (identical(other.color, color) || other.color == color) &&
            const DeepCollectionEquality()
                .equals(other._initialPosition, _initialPosition));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, labelKey, imagePath,
      iconName, color, const DeepCollectionEquality().hash(_initialPosition));

  /// Create a copy of TaskItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskItemImplCopyWith<_$TaskItemImpl> get copyWith =>
      __$$TaskItemImplCopyWithImpl<_$TaskItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskItemImplToJson(
      this,
    );
  }
}

abstract class _TaskItem implements TaskItem {
  const factory _TaskItem(
      {required final String id,
      required final String labelKey,
      final String? imagePath,
      final String? iconName,
      final String? color,
      final List<double> initialPosition}) = _$TaskItemImpl;

  factory _TaskItem.fromJson(Map<String, dynamic> json) =
      _$TaskItemImpl.fromJson;

  /// Item ID
  @override
  String get id;

  /// Item label (localized key)
  @override
  String get labelKey;

  /// Item image path
  @override
  String? get imagePath;

  /// Item icon name
  @override
  String? get iconName;

  /// Item color (hex)
  @override
  String? get color;

  /// Initial position (x, y)
  @override
  List<double> get initialPosition;

  /// Create a copy of TaskItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskItemImplCopyWith<_$TaskItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TaskTarget _$TaskTargetFromJson(Map<String, dynamic> json) {
  return _TaskTarget.fromJson(json);
}

/// @nodoc
mixin _$TaskTarget {
  /// Target ID
  String get id => throw _privateConstructorUsedError;

  /// Target label (localized key)
  String? get labelKey => throw _privateConstructorUsedError;

  /// Target image path
  String? get imagePath => throw _privateConstructorUsedError;

  /// Target position (x, y)
  List<double> get position => throw _privateConstructorUsedError;

  /// Target size (width, height)
  List<double> get size => throw _privateConstructorUsedError;

  /// Target shape (circle, rectangle, custom)
  String get shape => throw _privateConstructorUsedError;

  /// Serializes this TaskTarget to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaskTarget
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskTargetCopyWith<TaskTarget> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskTargetCopyWith<$Res> {
  factory $TaskTargetCopyWith(
          TaskTarget value, $Res Function(TaskTarget) then) =
      _$TaskTargetCopyWithImpl<$Res, TaskTarget>;
  @useResult
  $Res call(
      {String id,
      String? labelKey,
      String? imagePath,
      List<double> position,
      List<double> size,
      String shape});
}

/// @nodoc
class _$TaskTargetCopyWithImpl<$Res, $Val extends TaskTarget>
    implements $TaskTargetCopyWith<$Res> {
  _$TaskTargetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskTarget
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? labelKey = freezed,
    Object? imagePath = freezed,
    Object? position = null,
    Object? size = null,
    Object? shape = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      labelKey: freezed == labelKey
          ? _value.labelKey
          : labelKey // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as List<double>,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as List<double>,
      shape: null == shape
          ? _value.shape
          : shape // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskTargetImplCopyWith<$Res>
    implements $TaskTargetCopyWith<$Res> {
  factory _$$TaskTargetImplCopyWith(
          _$TaskTargetImpl value, $Res Function(_$TaskTargetImpl) then) =
      __$$TaskTargetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? labelKey,
      String? imagePath,
      List<double> position,
      List<double> size,
      String shape});
}

/// @nodoc
class __$$TaskTargetImplCopyWithImpl<$Res>
    extends _$TaskTargetCopyWithImpl<$Res, _$TaskTargetImpl>
    implements _$$TaskTargetImplCopyWith<$Res> {
  __$$TaskTargetImplCopyWithImpl(
      _$TaskTargetImpl _value, $Res Function(_$TaskTargetImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskTarget
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? labelKey = freezed,
    Object? imagePath = freezed,
    Object? position = null,
    Object? size = null,
    Object? shape = null,
  }) {
    return _then(_$TaskTargetImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      labelKey: freezed == labelKey
          ? _value.labelKey
          : labelKey // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      position: null == position
          ? _value._position
          : position // ignore: cast_nullable_to_non_nullable
              as List<double>,
      size: null == size
          ? _value._size
          : size // ignore: cast_nullable_to_non_nullable
              as List<double>,
      shape: null == shape
          ? _value.shape
          : shape // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskTargetImpl implements _TaskTarget {
  const _$TaskTargetImpl(
      {required this.id,
      this.labelKey,
      this.imagePath,
      required final List<double> position,
      required final List<double> size,
      this.shape = 'rectangle'})
      : _position = position,
        _size = size;

  factory _$TaskTargetImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskTargetImplFromJson(json);

  /// Target ID
  @override
  final String id;

  /// Target label (localized key)
  @override
  final String? labelKey;

  /// Target image path
  @override
  final String? imagePath;

  /// Target position (x, y)
  final List<double> _position;

  /// Target position (x, y)
  @override
  List<double> get position {
    if (_position is EqualUnmodifiableListView) return _position;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_position);
  }

  /// Target size (width, height)
  final List<double> _size;

  /// Target size (width, height)
  @override
  List<double> get size {
    if (_size is EqualUnmodifiableListView) return _size;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_size);
  }

  /// Target shape (circle, rectangle, custom)
  @override
  @JsonKey()
  final String shape;

  @override
  String toString() {
    return 'TaskTarget(id: $id, labelKey: $labelKey, imagePath: $imagePath, position: $position, size: $size, shape: $shape)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskTargetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.labelKey, labelKey) ||
                other.labelKey == labelKey) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            const DeepCollectionEquality().equals(other._position, _position) &&
            const DeepCollectionEquality().equals(other._size, _size) &&
            (identical(other.shape, shape) || other.shape == shape));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      labelKey,
      imagePath,
      const DeepCollectionEquality().hash(_position),
      const DeepCollectionEquality().hash(_size),
      shape);

  /// Create a copy of TaskTarget
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskTargetImplCopyWith<_$TaskTargetImpl> get copyWith =>
      __$$TaskTargetImplCopyWithImpl<_$TaskTargetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskTargetImplToJson(
      this,
    );
  }
}

abstract class _TaskTarget implements TaskTarget {
  const factory _TaskTarget(
      {required final String id,
      final String? labelKey,
      final String? imagePath,
      required final List<double> position,
      required final List<double> size,
      final String shape}) = _$TaskTargetImpl;

  factory _TaskTarget.fromJson(Map<String, dynamic> json) =
      _$TaskTargetImpl.fromJson;

  /// Target ID
  @override
  String get id;

  /// Target label (localized key)
  @override
  String? get labelKey;

  /// Target image path
  @override
  String? get imagePath;

  /// Target position (x, y)
  @override
  List<double> get position;

  /// Target size (width, height)
  @override
  List<double> get size;

  /// Target shape (circle, rectangle, custom)
  @override
  String get shape;

  /// Create a copy of TaskTarget
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskTargetImplCopyWith<_$TaskTargetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TaskResult _$TaskResultFromJson(Map<String, dynamic> json) {
  return _TaskResult.fromJson(json);
}

/// @nodoc
mixin _$TaskResult {
  /// Task ID
  String get taskId => throw _privateConstructorUsedError;

  /// User answers (itemId -> targetId)
  Map<String, String> get userAnswers => throw _privateConstructorUsedError;

  /// Correct answers count
  int get correctCount => throw _privateConstructorUsedError;

  /// Total items count
  int get totalCount => throw _privateConstructorUsedError;

  /// Time taken in seconds
  int get timeTakenSeconds => throw _privateConstructorUsedError;

  /// Is passed (correctCount >= minCorrectToPass)
  bool get isPassed => throw _privateConstructorUsedError;

  /// Completion timestamp
  DateTime get completedAt => throw _privateConstructorUsedError;

  /// Serializes this TaskResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaskResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskResultCopyWith<TaskResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskResultCopyWith<$Res> {
  factory $TaskResultCopyWith(
          TaskResult value, $Res Function(TaskResult) then) =
      _$TaskResultCopyWithImpl<$Res, TaskResult>;
  @useResult
  $Res call(
      {String taskId,
      Map<String, String> userAnswers,
      int correctCount,
      int totalCount,
      int timeTakenSeconds,
      bool isPassed,
      DateTime completedAt});
}

/// @nodoc
class _$TaskResultCopyWithImpl<$Res, $Val extends TaskResult>
    implements $TaskResultCopyWith<$Res> {
  _$TaskResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
    Object? userAnswers = null,
    Object? correctCount = null,
    Object? totalCount = null,
    Object? timeTakenSeconds = null,
    Object? isPassed = null,
    Object? completedAt = null,
  }) {
    return _then(_value.copyWith(
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      userAnswers: null == userAnswers
          ? _value.userAnswers
          : userAnswers // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      correctCount: null == correctCount
          ? _value.correctCount
          : correctCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      timeTakenSeconds: null == timeTakenSeconds
          ? _value.timeTakenSeconds
          : timeTakenSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      isPassed: null == isPassed
          ? _value.isPassed
          : isPassed // ignore: cast_nullable_to_non_nullable
              as bool,
      completedAt: null == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskResultImplCopyWith<$Res>
    implements $TaskResultCopyWith<$Res> {
  factory _$$TaskResultImplCopyWith(
          _$TaskResultImpl value, $Res Function(_$TaskResultImpl) then) =
      __$$TaskResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String taskId,
      Map<String, String> userAnswers,
      int correctCount,
      int totalCount,
      int timeTakenSeconds,
      bool isPassed,
      DateTime completedAt});
}

/// @nodoc
class __$$TaskResultImplCopyWithImpl<$Res>
    extends _$TaskResultCopyWithImpl<$Res, _$TaskResultImpl>
    implements _$$TaskResultImplCopyWith<$Res> {
  __$$TaskResultImplCopyWithImpl(
      _$TaskResultImpl _value, $Res Function(_$TaskResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
    Object? userAnswers = null,
    Object? correctCount = null,
    Object? totalCount = null,
    Object? timeTakenSeconds = null,
    Object? isPassed = null,
    Object? completedAt = null,
  }) {
    return _then(_$TaskResultImpl(
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      userAnswers: null == userAnswers
          ? _value._userAnswers
          : userAnswers // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      correctCount: null == correctCount
          ? _value.correctCount
          : correctCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      timeTakenSeconds: null == timeTakenSeconds
          ? _value.timeTakenSeconds
          : timeTakenSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      isPassed: null == isPassed
          ? _value.isPassed
          : isPassed // ignore: cast_nullable_to_non_nullable
              as bool,
      completedAt: null == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskResultImpl implements _TaskResult {
  const _$TaskResultImpl(
      {required this.taskId,
      required final Map<String, String> userAnswers,
      required this.correctCount,
      required this.totalCount,
      required this.timeTakenSeconds,
      required this.isPassed,
      required this.completedAt})
      : _userAnswers = userAnswers;

  factory _$TaskResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskResultImplFromJson(json);

  /// Task ID
  @override
  final String taskId;

  /// User answers (itemId -> targetId)
  final Map<String, String> _userAnswers;

  /// User answers (itemId -> targetId)
  @override
  Map<String, String> get userAnswers {
    if (_userAnswers is EqualUnmodifiableMapView) return _userAnswers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_userAnswers);
  }

  /// Correct answers count
  @override
  final int correctCount;

  /// Total items count
  @override
  final int totalCount;

  /// Time taken in seconds
  @override
  final int timeTakenSeconds;

  /// Is passed (correctCount >= minCorrectToPass)
  @override
  final bool isPassed;

  /// Completion timestamp
  @override
  final DateTime completedAt;

  @override
  String toString() {
    return 'TaskResult(taskId: $taskId, userAnswers: $userAnswers, correctCount: $correctCount, totalCount: $totalCount, timeTakenSeconds: $timeTakenSeconds, isPassed: $isPassed, completedAt: $completedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskResultImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            const DeepCollectionEquality()
                .equals(other._userAnswers, _userAnswers) &&
            (identical(other.correctCount, correctCount) ||
                other.correctCount == correctCount) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.timeTakenSeconds, timeTakenSeconds) ||
                other.timeTakenSeconds == timeTakenSeconds) &&
            (identical(other.isPassed, isPassed) ||
                other.isPassed == isPassed) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      taskId,
      const DeepCollectionEquality().hash(_userAnswers),
      correctCount,
      totalCount,
      timeTakenSeconds,
      isPassed,
      completedAt);

  /// Create a copy of TaskResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskResultImplCopyWith<_$TaskResultImpl> get copyWith =>
      __$$TaskResultImplCopyWithImpl<_$TaskResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskResultImplToJson(
      this,
    );
  }
}

abstract class _TaskResult implements TaskResult {
  const factory _TaskResult(
      {required final String taskId,
      required final Map<String, String> userAnswers,
      required final int correctCount,
      required final int totalCount,
      required final int timeTakenSeconds,
      required final bool isPassed,
      required final DateTime completedAt}) = _$TaskResultImpl;

  factory _TaskResult.fromJson(Map<String, dynamic> json) =
      _$TaskResultImpl.fromJson;

  /// Task ID
  @override
  String get taskId;

  /// User answers (itemId -> targetId)
  @override
  Map<String, String> get userAnswers;

  /// Correct answers count
  @override
  int get correctCount;

  /// Total items count
  @override
  int get totalCount;

  /// Time taken in seconds
  @override
  int get timeTakenSeconds;

  /// Is passed (correctCount >= minCorrectToPass)
  @override
  bool get isPassed;

  /// Completion timestamp
  @override
  DateTime get completedAt;

  /// Create a copy of TaskResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskResultImplCopyWith<_$TaskResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
