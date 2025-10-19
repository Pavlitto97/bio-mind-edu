import 'package:freezed_annotation/freezed_annotation.dart';

part 'interactive_task.freezed.dart';
part 'interactive_task.g.dart';

/// Interactive task type
enum TaskType {
  @JsonValue('drag_drop')
  dragDrop,
  
  @JsonValue('tap_select')
  tapSelect,
  
  @JsonValue('sequence')
  sequence,
  
  @JsonValue('matching')
  matching,
}

/// Interactive task entity
@freezed
class InteractiveTask with _$InteractiveTask {
  const factory InteractiveTask({
    /// Task ID
    required String id,
    
    /// Task title (localized key)
    required String titleKey,
    
    /// Task instruction (localized key)
    required String instructionKey,
    
    /// Task type
    required TaskType type,
    
    /// Task items (draggable elements)
    required List<TaskItem> items,
    
    /// Target zones (drop zones)
    required List<TaskTarget> targets,
    
    /// Correct matches (itemId -> targetId)
    required Map<String, String> correctMatches,
    
    /// Success voice file
    String? successVoiceFile,
    
    /// Error voice file
    String? errorVoiceFile,
    
    /// Hint voice file
    String? hintVoiceFile,
    
    /// Time limit in seconds (null = no limit)
    int? timeLimitSeconds,
    
    /// Minimum correct answers to pass
    @Default(1) int minCorrectToPass,
  }) = _InteractiveTask;

  factory InteractiveTask.fromJson(Map<String, dynamic> json) =>
      _$InteractiveTaskFromJson(json);
}

/// Task item (draggable element)
@freezed
class TaskItem with _$TaskItem {
  const factory TaskItem({
    /// Item ID
    required String id,
    
    /// Item label (localized key)
    required String labelKey,
    
    /// Item image path
    String? imagePath,
    
    /// Item icon name
    String? iconName,
    
    /// Item color (hex)
    String? color,
    
    /// Initial position (x, y)
    @Default([0.0, 0.0]) List<double> initialPosition,
  }) = _TaskItem;

  factory TaskItem.fromJson(Map<String, dynamic> json) =>
      _$TaskItemFromJson(json);
}

/// Task target (drop zone)
@freezed
class TaskTarget with _$TaskTarget {
  const factory TaskTarget({
    /// Target ID
    required String id,
    
    /// Target label (localized key)
    String? labelKey,
    
    /// Target image path
    String? imagePath,
    
    /// Target position (x, y)
    required List<double> position,
    
    /// Target size (width, height)
    required List<double> size,
    
    /// Target shape (circle, rectangle, custom)
    @Default('rectangle') String shape,
  }) = _TaskTarget;

  factory TaskTarget.fromJson(Map<String, dynamic> json) =>
      _$TaskTargetFromJson(json);
}

/// Task completion result
@freezed
class TaskResult with _$TaskResult {
  const factory TaskResult({
    /// Task ID
    required String taskId,
    
    /// User answers (itemId -> targetId)
    required Map<String, String> userAnswers,
    
    /// Correct answers count
    required int correctCount,
    
    /// Total items count
    required int totalCount,
    
    /// Time taken in seconds
    required int timeTakenSeconds,
    
    /// Is passed (correctCount >= minCorrectToPass)
    required bool isPassed,
    
    /// Completion timestamp
    required DateTime completedAt,
  }) = _TaskResult;

  factory TaskResult.fromJson(Map<String, dynamic> json) =>
      _$TaskResultFromJson(json);
}
