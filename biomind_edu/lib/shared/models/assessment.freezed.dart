// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assessment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AssessmentTest _$AssessmentTestFromJson(Map<String, dynamic> json) {
  return _AssessmentTest.fromJson(json);
}

/// @nodoc
mixin _$AssessmentTest {
  /// Test ID
  String get id => throw _privateConstructorUsedError;

  /// Test title (localized key)
  String get titleKey => throw _privateConstructorUsedError;

  /// Test questions
  List<Question> get questions => throw _privateConstructorUsedError;

  /// Passing score (0.0 - 1.0)
  double get passingScore => throw _privateConstructorUsedError;

  /// Time limit in seconds (null = no limit)
  int? get timeLimitSeconds => throw _privateConstructorUsedError;

  /// Reward ID for passing
  String? get rewardId => throw _privateConstructorUsedError;

  /// Serializes this AssessmentTest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AssessmentTest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssessmentTestCopyWith<AssessmentTest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssessmentTestCopyWith<$Res> {
  factory $AssessmentTestCopyWith(
          AssessmentTest value, $Res Function(AssessmentTest) then) =
      _$AssessmentTestCopyWithImpl<$Res, AssessmentTest>;
  @useResult
  $Res call(
      {String id,
      String titleKey,
      List<Question> questions,
      double passingScore,
      int? timeLimitSeconds,
      String? rewardId});
}

/// @nodoc
class _$AssessmentTestCopyWithImpl<$Res, $Val extends AssessmentTest>
    implements $AssessmentTestCopyWith<$Res> {
  _$AssessmentTestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AssessmentTest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? titleKey = null,
    Object? questions = null,
    Object? passingScore = null,
    Object? timeLimitSeconds = freezed,
    Object? rewardId = freezed,
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
      questions: null == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Question>,
      passingScore: null == passingScore
          ? _value.passingScore
          : passingScore // ignore: cast_nullable_to_non_nullable
              as double,
      timeLimitSeconds: freezed == timeLimitSeconds
          ? _value.timeLimitSeconds
          : timeLimitSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      rewardId: freezed == rewardId
          ? _value.rewardId
          : rewardId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssessmentTestImplCopyWith<$Res>
    implements $AssessmentTestCopyWith<$Res> {
  factory _$$AssessmentTestImplCopyWith(_$AssessmentTestImpl value,
          $Res Function(_$AssessmentTestImpl) then) =
      __$$AssessmentTestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String titleKey,
      List<Question> questions,
      double passingScore,
      int? timeLimitSeconds,
      String? rewardId});
}

/// @nodoc
class __$$AssessmentTestImplCopyWithImpl<$Res>
    extends _$AssessmentTestCopyWithImpl<$Res, _$AssessmentTestImpl>
    implements _$$AssessmentTestImplCopyWith<$Res> {
  __$$AssessmentTestImplCopyWithImpl(
      _$AssessmentTestImpl _value, $Res Function(_$AssessmentTestImpl) _then)
      : super(_value, _then);

  /// Create a copy of AssessmentTest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? titleKey = null,
    Object? questions = null,
    Object? passingScore = null,
    Object? timeLimitSeconds = freezed,
    Object? rewardId = freezed,
  }) {
    return _then(_$AssessmentTestImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      titleKey: null == titleKey
          ? _value.titleKey
          : titleKey // ignore: cast_nullable_to_non_nullable
              as String,
      questions: null == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Question>,
      passingScore: null == passingScore
          ? _value.passingScore
          : passingScore // ignore: cast_nullable_to_non_nullable
              as double,
      timeLimitSeconds: freezed == timeLimitSeconds
          ? _value.timeLimitSeconds
          : timeLimitSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      rewardId: freezed == rewardId
          ? _value.rewardId
          : rewardId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssessmentTestImpl implements _AssessmentTest {
  const _$AssessmentTestImpl(
      {required this.id,
      required this.titleKey,
      required final List<Question> questions,
      this.passingScore = 0.8,
      this.timeLimitSeconds,
      this.rewardId})
      : _questions = questions;

  factory _$AssessmentTestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssessmentTestImplFromJson(json);

  /// Test ID
  @override
  final String id;

  /// Test title (localized key)
  @override
  final String titleKey;

  /// Test questions
  final List<Question> _questions;

  /// Test questions
  @override
  List<Question> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  /// Passing score (0.0 - 1.0)
  @override
  @JsonKey()
  final double passingScore;

  /// Time limit in seconds (null = no limit)
  @override
  final int? timeLimitSeconds;

  /// Reward ID for passing
  @override
  final String? rewardId;

  @override
  String toString() {
    return 'AssessmentTest(id: $id, titleKey: $titleKey, questions: $questions, passingScore: $passingScore, timeLimitSeconds: $timeLimitSeconds, rewardId: $rewardId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssessmentTestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.titleKey, titleKey) ||
                other.titleKey == titleKey) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions) &&
            (identical(other.passingScore, passingScore) ||
                other.passingScore == passingScore) &&
            (identical(other.timeLimitSeconds, timeLimitSeconds) ||
                other.timeLimitSeconds == timeLimitSeconds) &&
            (identical(other.rewardId, rewardId) ||
                other.rewardId == rewardId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      titleKey,
      const DeepCollectionEquality().hash(_questions),
      passingScore,
      timeLimitSeconds,
      rewardId);

  /// Create a copy of AssessmentTest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssessmentTestImplCopyWith<_$AssessmentTestImpl> get copyWith =>
      __$$AssessmentTestImplCopyWithImpl<_$AssessmentTestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssessmentTestImplToJson(
      this,
    );
  }
}

abstract class _AssessmentTest implements AssessmentTest {
  const factory _AssessmentTest(
      {required final String id,
      required final String titleKey,
      required final List<Question> questions,
      final double passingScore,
      final int? timeLimitSeconds,
      final String? rewardId}) = _$AssessmentTestImpl;

  factory _AssessmentTest.fromJson(Map<String, dynamic> json) =
      _$AssessmentTestImpl.fromJson;

  /// Test ID
  @override
  String get id;

  /// Test title (localized key)
  @override
  String get titleKey;

  /// Test questions
  @override
  List<Question> get questions;

  /// Passing score (0.0 - 1.0)
  @override
  double get passingScore;

  /// Time limit in seconds (null = no limit)
  @override
  int? get timeLimitSeconds;

  /// Reward ID for passing
  @override
  String? get rewardId;

  /// Create a copy of AssessmentTest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssessmentTestImplCopyWith<_$AssessmentTestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return _Question.fromJson(json);
}

/// @nodoc
mixin _$Question {
  /// Question ID
  String get id => throw _privateConstructorUsedError;

  /// Question text (localized key)
  String get questionKey => throw _privateConstructorUsedError;

  /// Question type
  QuestionType get type => throw _privateConstructorUsedError;

  /// Answer options
  List<AnswerOption> get options => throw _privateConstructorUsedError;

  /// Correct answer ID(s)
  List<String> get correctAnswerIds => throw _privateConstructorUsedError;

  /// Question image path
  String? get imagePath => throw _privateConstructorUsedError;

  /// Voice question file
  String? get voiceFile => throw _privateConstructorUsedError;

  /// Explanation (localized key)
  String? get explanationKey => throw _privateConstructorUsedError;

  /// Points for correct answer
  int get points => throw _privateConstructorUsedError;

  /// Serializes this Question to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuestionCopyWith<Question> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionCopyWith<$Res> {
  factory $QuestionCopyWith(Question value, $Res Function(Question) then) =
      _$QuestionCopyWithImpl<$Res, Question>;
  @useResult
  $Res call(
      {String id,
      String questionKey,
      QuestionType type,
      List<AnswerOption> options,
      List<String> correctAnswerIds,
      String? imagePath,
      String? voiceFile,
      String? explanationKey,
      int points});
}

/// @nodoc
class _$QuestionCopyWithImpl<$Res, $Val extends Question>
    implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? questionKey = null,
    Object? type = null,
    Object? options = null,
    Object? correctAnswerIds = null,
    Object? imagePath = freezed,
    Object? voiceFile = freezed,
    Object? explanationKey = freezed,
    Object? points = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      questionKey: null == questionKey
          ? _value.questionKey
          : questionKey // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as QuestionType,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<AnswerOption>,
      correctAnswerIds: null == correctAnswerIds
          ? _value.correctAnswerIds
          : correctAnswerIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      voiceFile: freezed == voiceFile
          ? _value.voiceFile
          : voiceFile // ignore: cast_nullable_to_non_nullable
              as String?,
      explanationKey: freezed == explanationKey
          ? _value.explanationKey
          : explanationKey // ignore: cast_nullable_to_non_nullable
              as String?,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuestionImplCopyWith<$Res>
    implements $QuestionCopyWith<$Res> {
  factory _$$QuestionImplCopyWith(
          _$QuestionImpl value, $Res Function(_$QuestionImpl) then) =
      __$$QuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String questionKey,
      QuestionType type,
      List<AnswerOption> options,
      List<String> correctAnswerIds,
      String? imagePath,
      String? voiceFile,
      String? explanationKey,
      int points});
}

/// @nodoc
class __$$QuestionImplCopyWithImpl<$Res>
    extends _$QuestionCopyWithImpl<$Res, _$QuestionImpl>
    implements _$$QuestionImplCopyWith<$Res> {
  __$$QuestionImplCopyWithImpl(
      _$QuestionImpl _value, $Res Function(_$QuestionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? questionKey = null,
    Object? type = null,
    Object? options = null,
    Object? correctAnswerIds = null,
    Object? imagePath = freezed,
    Object? voiceFile = freezed,
    Object? explanationKey = freezed,
    Object? points = null,
  }) {
    return _then(_$QuestionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      questionKey: null == questionKey
          ? _value.questionKey
          : questionKey // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as QuestionType,
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<AnswerOption>,
      correctAnswerIds: null == correctAnswerIds
          ? _value._correctAnswerIds
          : correctAnswerIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      voiceFile: freezed == voiceFile
          ? _value.voiceFile
          : voiceFile // ignore: cast_nullable_to_non_nullable
              as String?,
      explanationKey: freezed == explanationKey
          ? _value.explanationKey
          : explanationKey // ignore: cast_nullable_to_non_nullable
              as String?,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestionImpl implements _Question {
  const _$QuestionImpl(
      {required this.id,
      required this.questionKey,
      required this.type,
      required final List<AnswerOption> options,
      required final List<String> correctAnswerIds,
      this.imagePath,
      this.voiceFile,
      this.explanationKey,
      this.points = 1})
      : _options = options,
        _correctAnswerIds = correctAnswerIds;

  factory _$QuestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionImplFromJson(json);

  /// Question ID
  @override
  final String id;

  /// Question text (localized key)
  @override
  final String questionKey;

  /// Question type
  @override
  final QuestionType type;

  /// Answer options
  final List<AnswerOption> _options;

  /// Answer options
  @override
  List<AnswerOption> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  /// Correct answer ID(s)
  final List<String> _correctAnswerIds;

  /// Correct answer ID(s)
  @override
  List<String> get correctAnswerIds {
    if (_correctAnswerIds is EqualUnmodifiableListView)
      return _correctAnswerIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_correctAnswerIds);
  }

  /// Question image path
  @override
  final String? imagePath;

  /// Voice question file
  @override
  final String? voiceFile;

  /// Explanation (localized key)
  @override
  final String? explanationKey;

  /// Points for correct answer
  @override
  @JsonKey()
  final int points;

  @override
  String toString() {
    return 'Question(id: $id, questionKey: $questionKey, type: $type, options: $options, correctAnswerIds: $correctAnswerIds, imagePath: $imagePath, voiceFile: $voiceFile, explanationKey: $explanationKey, points: $points)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.questionKey, questionKey) ||
                other.questionKey == questionKey) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            const DeepCollectionEquality()
                .equals(other._correctAnswerIds, _correctAnswerIds) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.voiceFile, voiceFile) ||
                other.voiceFile == voiceFile) &&
            (identical(other.explanationKey, explanationKey) ||
                other.explanationKey == explanationKey) &&
            (identical(other.points, points) || other.points == points));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      questionKey,
      type,
      const DeepCollectionEquality().hash(_options),
      const DeepCollectionEquality().hash(_correctAnswerIds),
      imagePath,
      voiceFile,
      explanationKey,
      points);

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionImplCopyWith<_$QuestionImpl> get copyWith =>
      __$$QuestionImplCopyWithImpl<_$QuestionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionImplToJson(
      this,
    );
  }
}

abstract class _Question implements Question {
  const factory _Question(
      {required final String id,
      required final String questionKey,
      required final QuestionType type,
      required final List<AnswerOption> options,
      required final List<String> correctAnswerIds,
      final String? imagePath,
      final String? voiceFile,
      final String? explanationKey,
      final int points}) = _$QuestionImpl;

  factory _Question.fromJson(Map<String, dynamic> json) =
      _$QuestionImpl.fromJson;

  /// Question ID
  @override
  String get id;

  /// Question text (localized key)
  @override
  String get questionKey;

  /// Question type
  @override
  QuestionType get type;

  /// Answer options
  @override
  List<AnswerOption> get options;

  /// Correct answer ID(s)
  @override
  List<String> get correctAnswerIds;

  /// Question image path
  @override
  String? get imagePath;

  /// Voice question file
  @override
  String? get voiceFile;

  /// Explanation (localized key)
  @override
  String? get explanationKey;

  /// Points for correct answer
  @override
  int get points;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestionImplCopyWith<_$QuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnswerOption _$AnswerOptionFromJson(Map<String, dynamic> json) {
  return _AnswerOption.fromJson(json);
}

/// @nodoc
mixin _$AnswerOption {
  /// Option ID
  String get id => throw _privateConstructorUsedError;

  /// Option text (localized key)
  String get textKey => throw _privateConstructorUsedError;

  /// Option image path
  String? get imagePath => throw _privateConstructorUsedError;

  /// Option icon name
  String? get iconName => throw _privateConstructorUsedError;

  /// Serializes this AnswerOption to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnswerOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnswerOptionCopyWith<AnswerOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerOptionCopyWith<$Res> {
  factory $AnswerOptionCopyWith(
          AnswerOption value, $Res Function(AnswerOption) then) =
      _$AnswerOptionCopyWithImpl<$Res, AnswerOption>;
  @useResult
  $Res call({String id, String textKey, String? imagePath, String? iconName});
}

/// @nodoc
class _$AnswerOptionCopyWithImpl<$Res, $Val extends AnswerOption>
    implements $AnswerOptionCopyWith<$Res> {
  _$AnswerOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnswerOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? textKey = null,
    Object? imagePath = freezed,
    Object? iconName = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      textKey: null == textKey
          ? _value.textKey
          : textKey // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      iconName: freezed == iconName
          ? _value.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnswerOptionImplCopyWith<$Res>
    implements $AnswerOptionCopyWith<$Res> {
  factory _$$AnswerOptionImplCopyWith(
          _$AnswerOptionImpl value, $Res Function(_$AnswerOptionImpl) then) =
      __$$AnswerOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String textKey, String? imagePath, String? iconName});
}

/// @nodoc
class __$$AnswerOptionImplCopyWithImpl<$Res>
    extends _$AnswerOptionCopyWithImpl<$Res, _$AnswerOptionImpl>
    implements _$$AnswerOptionImplCopyWith<$Res> {
  __$$AnswerOptionImplCopyWithImpl(
      _$AnswerOptionImpl _value, $Res Function(_$AnswerOptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnswerOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? textKey = null,
    Object? imagePath = freezed,
    Object? iconName = freezed,
  }) {
    return _then(_$AnswerOptionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      textKey: null == textKey
          ? _value.textKey
          : textKey // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      iconName: freezed == iconName
          ? _value.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnswerOptionImpl implements _AnswerOption {
  const _$AnswerOptionImpl(
      {required this.id, required this.textKey, this.imagePath, this.iconName});

  factory _$AnswerOptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnswerOptionImplFromJson(json);

  /// Option ID
  @override
  final String id;

  /// Option text (localized key)
  @override
  final String textKey;

  /// Option image path
  @override
  final String? imagePath;

  /// Option icon name
  @override
  final String? iconName;

  @override
  String toString() {
    return 'AnswerOption(id: $id, textKey: $textKey, imagePath: $imagePath, iconName: $iconName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnswerOptionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.textKey, textKey) || other.textKey == textKey) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.iconName, iconName) ||
                other.iconName == iconName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, textKey, imagePath, iconName);

  /// Create a copy of AnswerOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnswerOptionImplCopyWith<_$AnswerOptionImpl> get copyWith =>
      __$$AnswerOptionImplCopyWithImpl<_$AnswerOptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnswerOptionImplToJson(
      this,
    );
  }
}

abstract class _AnswerOption implements AnswerOption {
  const factory _AnswerOption(
      {required final String id,
      required final String textKey,
      final String? imagePath,
      final String? iconName}) = _$AnswerOptionImpl;

  factory _AnswerOption.fromJson(Map<String, dynamic> json) =
      _$AnswerOptionImpl.fromJson;

  /// Option ID
  @override
  String get id;

  /// Option text (localized key)
  @override
  String get textKey;

  /// Option image path
  @override
  String? get imagePath;

  /// Option icon name
  @override
  String? get iconName;

  /// Create a copy of AnswerOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnswerOptionImplCopyWith<_$AnswerOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TestResult _$TestResultFromJson(Map<String, dynamic> json) {
  return _TestResult.fromJson(json);
}

/// @nodoc
mixin _$TestResult {
  /// Test ID
  String get testId => throw _privateConstructorUsedError;

  /// User answers (questionId -> answerId)
  Map<String, List<String>> get userAnswers =>
      throw _privateConstructorUsedError;

  /// Correct answers count
  int get correctCount => throw _privateConstructorUsedError;

  /// Total questions count
  int get totalCount => throw _privateConstructorUsedError;

  /// Score (0.0 - 1.0)
  double get score => throw _privateConstructorUsedError;

  /// Is passed
  bool get isPassed => throw _privateConstructorUsedError;

  /// Time taken in seconds
  int get timeTakenSeconds => throw _privateConstructorUsedError;

  /// Completion timestamp
  DateTime get completedAt => throw _privateConstructorUsedError;

  /// Detailed results per question
  List<QuestionResult> get questionResults =>
      throw _privateConstructorUsedError;

  /// Serializes this TestResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TestResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TestResultCopyWith<TestResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestResultCopyWith<$Res> {
  factory $TestResultCopyWith(
          TestResult value, $Res Function(TestResult) then) =
      _$TestResultCopyWithImpl<$Res, TestResult>;
  @useResult
  $Res call(
      {String testId,
      Map<String, List<String>> userAnswers,
      int correctCount,
      int totalCount,
      double score,
      bool isPassed,
      int timeTakenSeconds,
      DateTime completedAt,
      List<QuestionResult> questionResults});
}

/// @nodoc
class _$TestResultCopyWithImpl<$Res, $Val extends TestResult>
    implements $TestResultCopyWith<$Res> {
  _$TestResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TestResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? testId = null,
    Object? userAnswers = null,
    Object? correctCount = null,
    Object? totalCount = null,
    Object? score = null,
    Object? isPassed = null,
    Object? timeTakenSeconds = null,
    Object? completedAt = null,
    Object? questionResults = null,
  }) {
    return _then(_value.copyWith(
      testId: null == testId
          ? _value.testId
          : testId // ignore: cast_nullable_to_non_nullable
              as String,
      userAnswers: null == userAnswers
          ? _value.userAnswers
          : userAnswers // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
      correctCount: null == correctCount
          ? _value.correctCount
          : correctCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      isPassed: null == isPassed
          ? _value.isPassed
          : isPassed // ignore: cast_nullable_to_non_nullable
              as bool,
      timeTakenSeconds: null == timeTakenSeconds
          ? _value.timeTakenSeconds
          : timeTakenSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      completedAt: null == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      questionResults: null == questionResults
          ? _value.questionResults
          : questionResults // ignore: cast_nullable_to_non_nullable
              as List<QuestionResult>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TestResultImplCopyWith<$Res>
    implements $TestResultCopyWith<$Res> {
  factory _$$TestResultImplCopyWith(
          _$TestResultImpl value, $Res Function(_$TestResultImpl) then) =
      __$$TestResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String testId,
      Map<String, List<String>> userAnswers,
      int correctCount,
      int totalCount,
      double score,
      bool isPassed,
      int timeTakenSeconds,
      DateTime completedAt,
      List<QuestionResult> questionResults});
}

/// @nodoc
class __$$TestResultImplCopyWithImpl<$Res>
    extends _$TestResultCopyWithImpl<$Res, _$TestResultImpl>
    implements _$$TestResultImplCopyWith<$Res> {
  __$$TestResultImplCopyWithImpl(
      _$TestResultImpl _value, $Res Function(_$TestResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of TestResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? testId = null,
    Object? userAnswers = null,
    Object? correctCount = null,
    Object? totalCount = null,
    Object? score = null,
    Object? isPassed = null,
    Object? timeTakenSeconds = null,
    Object? completedAt = null,
    Object? questionResults = null,
  }) {
    return _then(_$TestResultImpl(
      testId: null == testId
          ? _value.testId
          : testId // ignore: cast_nullable_to_non_nullable
              as String,
      userAnswers: null == userAnswers
          ? _value._userAnswers
          : userAnswers // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
      correctCount: null == correctCount
          ? _value.correctCount
          : correctCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      isPassed: null == isPassed
          ? _value.isPassed
          : isPassed // ignore: cast_nullable_to_non_nullable
              as bool,
      timeTakenSeconds: null == timeTakenSeconds
          ? _value.timeTakenSeconds
          : timeTakenSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      completedAt: null == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      questionResults: null == questionResults
          ? _value._questionResults
          : questionResults // ignore: cast_nullable_to_non_nullable
              as List<QuestionResult>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TestResultImpl implements _TestResult {
  const _$TestResultImpl(
      {required this.testId,
      required final Map<String, List<String>> userAnswers,
      required this.correctCount,
      required this.totalCount,
      required this.score,
      required this.isPassed,
      required this.timeTakenSeconds,
      required this.completedAt,
      final List<QuestionResult> questionResults = const []})
      : _userAnswers = userAnswers,
        _questionResults = questionResults;

  factory _$TestResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$TestResultImplFromJson(json);

  /// Test ID
  @override
  final String testId;

  /// User answers (questionId -> answerId)
  final Map<String, List<String>> _userAnswers;

  /// User answers (questionId -> answerId)
  @override
  Map<String, List<String>> get userAnswers {
    if (_userAnswers is EqualUnmodifiableMapView) return _userAnswers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_userAnswers);
  }

  /// Correct answers count
  @override
  final int correctCount;

  /// Total questions count
  @override
  final int totalCount;

  /// Score (0.0 - 1.0)
  @override
  final double score;

  /// Is passed
  @override
  final bool isPassed;

  /// Time taken in seconds
  @override
  final int timeTakenSeconds;

  /// Completion timestamp
  @override
  final DateTime completedAt;

  /// Detailed results per question
  final List<QuestionResult> _questionResults;

  /// Detailed results per question
  @override
  @JsonKey()
  List<QuestionResult> get questionResults {
    if (_questionResults is EqualUnmodifiableListView) return _questionResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questionResults);
  }

  @override
  String toString() {
    return 'TestResult(testId: $testId, userAnswers: $userAnswers, correctCount: $correctCount, totalCount: $totalCount, score: $score, isPassed: $isPassed, timeTakenSeconds: $timeTakenSeconds, completedAt: $completedAt, questionResults: $questionResults)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TestResultImpl &&
            (identical(other.testId, testId) || other.testId == testId) &&
            const DeepCollectionEquality()
                .equals(other._userAnswers, _userAnswers) &&
            (identical(other.correctCount, correctCount) ||
                other.correctCount == correctCount) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.isPassed, isPassed) ||
                other.isPassed == isPassed) &&
            (identical(other.timeTakenSeconds, timeTakenSeconds) ||
                other.timeTakenSeconds == timeTakenSeconds) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            const DeepCollectionEquality()
                .equals(other._questionResults, _questionResults));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      testId,
      const DeepCollectionEquality().hash(_userAnswers),
      correctCount,
      totalCount,
      score,
      isPassed,
      timeTakenSeconds,
      completedAt,
      const DeepCollectionEquality().hash(_questionResults));

  /// Create a copy of TestResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TestResultImplCopyWith<_$TestResultImpl> get copyWith =>
      __$$TestResultImplCopyWithImpl<_$TestResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TestResultImplToJson(
      this,
    );
  }
}

abstract class _TestResult implements TestResult {
  const factory _TestResult(
      {required final String testId,
      required final Map<String, List<String>> userAnswers,
      required final int correctCount,
      required final int totalCount,
      required final double score,
      required final bool isPassed,
      required final int timeTakenSeconds,
      required final DateTime completedAt,
      final List<QuestionResult> questionResults}) = _$TestResultImpl;

  factory _TestResult.fromJson(Map<String, dynamic> json) =
      _$TestResultImpl.fromJson;

  /// Test ID
  @override
  String get testId;

  /// User answers (questionId -> answerId)
  @override
  Map<String, List<String>> get userAnswers;

  /// Correct answers count
  @override
  int get correctCount;

  /// Total questions count
  @override
  int get totalCount;

  /// Score (0.0 - 1.0)
  @override
  double get score;

  /// Is passed
  @override
  bool get isPassed;

  /// Time taken in seconds
  @override
  int get timeTakenSeconds;

  /// Completion timestamp
  @override
  DateTime get completedAt;

  /// Detailed results per question
  @override
  List<QuestionResult> get questionResults;

  /// Create a copy of TestResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TestResultImplCopyWith<_$TestResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuestionResult _$QuestionResultFromJson(Map<String, dynamic> json) {
  return _QuestionResult.fromJson(json);
}

/// @nodoc
mixin _$QuestionResult {
  /// Question ID
  String get questionId => throw _privateConstructorUsedError;

  /// User answer IDs
  List<String> get userAnswerIds => throw _privateConstructorUsedError;

  /// Correct answer IDs
  List<String> get correctAnswerIds => throw _privateConstructorUsedError;

  /// Is correct
  bool get isCorrect => throw _privateConstructorUsedError;

  /// Points earned
  int get pointsEarned => throw _privateConstructorUsedError;

  /// Serializes this QuestionResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuestionResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuestionResultCopyWith<QuestionResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionResultCopyWith<$Res> {
  factory $QuestionResultCopyWith(
          QuestionResult value, $Res Function(QuestionResult) then) =
      _$QuestionResultCopyWithImpl<$Res, QuestionResult>;
  @useResult
  $Res call(
      {String questionId,
      List<String> userAnswerIds,
      List<String> correctAnswerIds,
      bool isCorrect,
      int pointsEarned});
}

/// @nodoc
class _$QuestionResultCopyWithImpl<$Res, $Val extends QuestionResult>
    implements $QuestionResultCopyWith<$Res> {
  _$QuestionResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuestionResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? userAnswerIds = null,
    Object? correctAnswerIds = null,
    Object? isCorrect = null,
    Object? pointsEarned = null,
  }) {
    return _then(_value.copyWith(
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      userAnswerIds: null == userAnswerIds
          ? _value.userAnswerIds
          : userAnswerIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      correctAnswerIds: null == correctAnswerIds
          ? _value.correctAnswerIds
          : correctAnswerIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      pointsEarned: null == pointsEarned
          ? _value.pointsEarned
          : pointsEarned // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuestionResultImplCopyWith<$Res>
    implements $QuestionResultCopyWith<$Res> {
  factory _$$QuestionResultImplCopyWith(_$QuestionResultImpl value,
          $Res Function(_$QuestionResultImpl) then) =
      __$$QuestionResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String questionId,
      List<String> userAnswerIds,
      List<String> correctAnswerIds,
      bool isCorrect,
      int pointsEarned});
}

/// @nodoc
class __$$QuestionResultImplCopyWithImpl<$Res>
    extends _$QuestionResultCopyWithImpl<$Res, _$QuestionResultImpl>
    implements _$$QuestionResultImplCopyWith<$Res> {
  __$$QuestionResultImplCopyWithImpl(
      _$QuestionResultImpl _value, $Res Function(_$QuestionResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuestionResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? userAnswerIds = null,
    Object? correctAnswerIds = null,
    Object? isCorrect = null,
    Object? pointsEarned = null,
  }) {
    return _then(_$QuestionResultImpl(
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      userAnswerIds: null == userAnswerIds
          ? _value._userAnswerIds
          : userAnswerIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      correctAnswerIds: null == correctAnswerIds
          ? _value._correctAnswerIds
          : correctAnswerIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      pointsEarned: null == pointsEarned
          ? _value.pointsEarned
          : pointsEarned // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestionResultImpl implements _QuestionResult {
  const _$QuestionResultImpl(
      {required this.questionId,
      required final List<String> userAnswerIds,
      required final List<String> correctAnswerIds,
      required this.isCorrect,
      required this.pointsEarned})
      : _userAnswerIds = userAnswerIds,
        _correctAnswerIds = correctAnswerIds;

  factory _$QuestionResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionResultImplFromJson(json);

  /// Question ID
  @override
  final String questionId;

  /// User answer IDs
  final List<String> _userAnswerIds;

  /// User answer IDs
  @override
  List<String> get userAnswerIds {
    if (_userAnswerIds is EqualUnmodifiableListView) return _userAnswerIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userAnswerIds);
  }

  /// Correct answer IDs
  final List<String> _correctAnswerIds;

  /// Correct answer IDs
  @override
  List<String> get correctAnswerIds {
    if (_correctAnswerIds is EqualUnmodifiableListView)
      return _correctAnswerIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_correctAnswerIds);
  }

  /// Is correct
  @override
  final bool isCorrect;

  /// Points earned
  @override
  final int pointsEarned;

  @override
  String toString() {
    return 'QuestionResult(questionId: $questionId, userAnswerIds: $userAnswerIds, correctAnswerIds: $correctAnswerIds, isCorrect: $isCorrect, pointsEarned: $pointsEarned)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionResultImpl &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            const DeepCollectionEquality()
                .equals(other._userAnswerIds, _userAnswerIds) &&
            const DeepCollectionEquality()
                .equals(other._correctAnswerIds, _correctAnswerIds) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect) &&
            (identical(other.pointsEarned, pointsEarned) ||
                other.pointsEarned == pointsEarned));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      questionId,
      const DeepCollectionEquality().hash(_userAnswerIds),
      const DeepCollectionEquality().hash(_correctAnswerIds),
      isCorrect,
      pointsEarned);

  /// Create a copy of QuestionResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionResultImplCopyWith<_$QuestionResultImpl> get copyWith =>
      __$$QuestionResultImplCopyWithImpl<_$QuestionResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionResultImplToJson(
      this,
    );
  }
}

abstract class _QuestionResult implements QuestionResult {
  const factory _QuestionResult(
      {required final String questionId,
      required final List<String> userAnswerIds,
      required final List<String> correctAnswerIds,
      required final bool isCorrect,
      required final int pointsEarned}) = _$QuestionResultImpl;

  factory _QuestionResult.fromJson(Map<String, dynamic> json) =
      _$QuestionResultImpl.fromJson;

  /// Question ID
  @override
  String get questionId;

  /// User answer IDs
  @override
  List<String> get userAnswerIds;

  /// Correct answer IDs
  @override
  List<String> get correctAnswerIds;

  /// Is correct
  @override
  bool get isCorrect;

  /// Points earned
  @override
  int get pointsEarned;

  /// Create a copy of QuestionResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestionResultImplCopyWith<_$QuestionResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
