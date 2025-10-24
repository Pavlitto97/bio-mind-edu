// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interactive_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InteractiveTaskImpl _$$InteractiveTaskImplFromJson(
        Map<String, dynamic> json) =>
    _$InteractiveTaskImpl(
      id: json['id'] as String,
      titleKey: json['titleKey'] as String,
      instructionKey: json['instructionKey'] as String,
      type: $enumDecode(_$TaskTypeEnumMap, json['type']),
      items: (json['items'] as List<dynamic>)
          .map((e) => TaskItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      targets: (json['targets'] as List<dynamic>)
          .map((e) => TaskTarget.fromJson(e as Map<String, dynamic>))
          .toList(),
      correctMatches: Map<String, String>.from(json['correctMatches'] as Map),
      successVoiceFile: json['successVoiceFile'] as String?,
      errorVoiceFile: json['errorVoiceFile'] as String?,
      hintVoiceFile: json['hintVoiceFile'] as String?,
      timeLimitSeconds: (json['timeLimitSeconds'] as num?)?.toInt(),
      minCorrectToPass: (json['minCorrectToPass'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$$InteractiveTaskImplToJson(
        _$InteractiveTaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'titleKey': instance.titleKey,
      'instructionKey': instance.instructionKey,
      'type': _$TaskTypeEnumMap[instance.type]!,
      'items': instance.items,
      'targets': instance.targets,
      'correctMatches': instance.correctMatches,
      'successVoiceFile': instance.successVoiceFile,
      'errorVoiceFile': instance.errorVoiceFile,
      'hintVoiceFile': instance.hintVoiceFile,
      'timeLimitSeconds': instance.timeLimitSeconds,
      'minCorrectToPass': instance.minCorrectToPass,
    };

const _$TaskTypeEnumMap = {
  TaskType.dragDrop: 'drag_drop',
  TaskType.tapSelect: 'tap_select',
  TaskType.sequence: 'sequence',
  TaskType.matching: 'matching',
};

_$TaskItemImpl _$$TaskItemImplFromJson(Map<String, dynamic> json) =>
    _$TaskItemImpl(
      id: json['id'] as String,
      labelKey: json['labelKey'] as String,
      imagePath: json['imagePath'] as String?,
      iconName: json['iconName'] as String?,
      color: json['color'] as String?,
      initialPosition: (json['initialPosition'] as List<dynamic>?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          const [0.0, 0.0],
    );

Map<String, dynamic> _$$TaskItemImplToJson(_$TaskItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'labelKey': instance.labelKey,
      'imagePath': instance.imagePath,
      'iconName': instance.iconName,
      'color': instance.color,
      'initialPosition': instance.initialPosition,
    };

_$TaskTargetImpl _$$TaskTargetImplFromJson(Map<String, dynamic> json) =>
    _$TaskTargetImpl(
      id: json['id'] as String,
      labelKey: json['labelKey'] as String?,
      imagePath: json['imagePath'] as String?,
      position: (json['position'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      size: (json['size'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      shape: json['shape'] as String? ?? 'rectangle',
    );

Map<String, dynamic> _$$TaskTargetImplToJson(_$TaskTargetImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'labelKey': instance.labelKey,
      'imagePath': instance.imagePath,
      'position': instance.position,
      'size': instance.size,
      'shape': instance.shape,
    };

_$TaskResultImpl _$$TaskResultImplFromJson(Map<String, dynamic> json) =>
    _$TaskResultImpl(
      taskId: json['taskId'] as String,
      userAnswers: Map<String, String>.from(json['userAnswers'] as Map),
      correctCount: (json['correctCount'] as num).toInt(),
      totalCount: (json['totalCount'] as num).toInt(),
      timeTakenSeconds: (json['timeTakenSeconds'] as num).toInt(),
      isPassed: json['isPassed'] as bool,
      completedAt: DateTime.parse(json['completedAt'] as String),
    );

Map<String, dynamic> _$$TaskResultImplToJson(_$TaskResultImpl instance) =>
    <String, dynamic>{
      'taskId': instance.taskId,
      'userAnswers': instance.userAnswers,
      'correctCount': instance.correctCount,
      'totalCount': instance.totalCount,
      'timeTakenSeconds': instance.timeTakenSeconds,
      'isPassed': instance.isPassed,
      'completedAt': instance.completedAt.toIso8601String(),
    };
