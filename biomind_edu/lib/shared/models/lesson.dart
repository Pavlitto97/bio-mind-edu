import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson.freezed.dart';
part 'lesson.g.dart';

/// Lesson difficulty level
enum LessonDifficulty {
  @JsonValue('beginner')
  beginner, // 3-5 years

  @JsonValue('intermediate')
  intermediate, // 6-8 years
}

/// Lesson completion status
enum LessonStatus {
  @JsonValue('not_started')
  notStarted,

  @JsonValue('in_progress')
  inProgress,

  @JsonValue('completed')
  completed,
}

/// Lesson entity - represents a complete AR learning module
@freezed
class Lesson with _$Lesson {
  const factory Lesson({
    /// Unique lesson identifier
    required String id,

    /// Lesson title (localized key)
    required String titleKey,

    /// Lesson description (localized key)
    required String descriptionKey,

    /// Difficulty level
    required LessonDifficulty difficulty,

    /// 3D model file name
    required String modelFileName,

    /// Voice instruction audio files by locale
    required Map<String, List<String>> voiceFiles,

    /// Interactive task ID
    required String interactiveTaskId,

    /// Assessment test ID
    required String assessmentTestId,

    /// Reward ID to unlock upon completion
    required String rewardId,

    /// Lesson order in the curriculum
    required int order,

    /// Estimated duration in minutes
    required int durationMinutes,

    /// Required previous lessons (dependencies)
    @Default([]) List<String> prerequisites,

    /// AR scene annotations
    @Default([]) List<LessonAnnotation> annotations,

    /// Thumbnail image path
    String? thumbnailPath,

    /// Is lesson locked (requires prerequisites)
    @Default(false) bool isLocked,

    /// Completion status
    @Default(LessonStatus.notStarted) LessonStatus status,
  }) = _Lesson;

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);
}

/// Annotation for AR model parts
@freezed
class LessonAnnotation with _$LessonAnnotation {
  const factory LessonAnnotation({
    /// Annotation ID
    required String id,

    /// Part name (localized key)
    required String nameKey,

    /// Part description (localized key)
    required String descriptionKey,

    /// 3D model part identifier
    required String modelPartId,

    /// Voice explanation audio file
    String? voiceFile,

    /// Position in 3D space (x, y, z)
    @Default([0.0, 0.0, 0.0]) List<double> position,
  }) = _LessonAnnotation;

  factory LessonAnnotation.fromJson(Map<String, dynamic> json) =>
      _$LessonAnnotationFromJson(json);
}
