// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LessonImpl _$$LessonImplFromJson(Map<String, dynamic> json) => _$LessonImpl(
      id: json['id'] as String,
      titleKey: json['titleKey'] as String,
      descriptionKey: json['descriptionKey'] as String,
      difficulty: $enumDecode(_$LessonDifficultyEnumMap, json['difficulty']),
      modelFileName: json['modelFileName'] as String,
      voiceFiles: (json['voiceFiles'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
      interactiveTaskId: json['interactiveTaskId'] as String,
      assessmentTestId: json['assessmentTestId'] as String,
      rewardId: json['rewardId'] as String,
      order: (json['order'] as num).toInt(),
      durationMinutes: (json['durationMinutes'] as num).toInt(),
      prerequisites: (json['prerequisites'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      annotations: (json['annotations'] as List<dynamic>?)
              ?.map((e) => LessonAnnotation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      thumbnailPath: json['thumbnailPath'] as String?,
      isLocked: json['isLocked'] as bool? ?? false,
      status: $enumDecodeNullable(_$LessonStatusEnumMap, json['status']) ??
          LessonStatus.notStarted,
    );

Map<String, dynamic> _$$LessonImplToJson(_$LessonImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'titleKey': instance.titleKey,
      'descriptionKey': instance.descriptionKey,
      'difficulty': _$LessonDifficultyEnumMap[instance.difficulty]!,
      'modelFileName': instance.modelFileName,
      'voiceFiles': instance.voiceFiles,
      'interactiveTaskId': instance.interactiveTaskId,
      'assessmentTestId': instance.assessmentTestId,
      'rewardId': instance.rewardId,
      'order': instance.order,
      'durationMinutes': instance.durationMinutes,
      'prerequisites': instance.prerequisites,
      'annotations': instance.annotations,
      'thumbnailPath': instance.thumbnailPath,
      'isLocked': instance.isLocked,
      'status': _$LessonStatusEnumMap[instance.status]!,
    };

const _$LessonDifficultyEnumMap = {
  LessonDifficulty.beginner: 'beginner',
  LessonDifficulty.intermediate: 'intermediate',
};

const _$LessonStatusEnumMap = {
  LessonStatus.notStarted: 'not_started',
  LessonStatus.inProgress: 'in_progress',
  LessonStatus.completed: 'completed',
};

_$LessonAnnotationImpl _$$LessonAnnotationImplFromJson(
        Map<String, dynamic> json) =>
    _$LessonAnnotationImpl(
      id: json['id'] as String,
      nameKey: json['nameKey'] as String,
      descriptionKey: json['descriptionKey'] as String,
      modelPartId: json['modelPartId'] as String,
      voiceFile: json['voiceFile'] as String?,
      position: (json['position'] as List<dynamic>?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          const [0.0, 0.0, 0.0],
    );

Map<String, dynamic> _$$LessonAnnotationImplToJson(
        _$LessonAnnotationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameKey': instance.nameKey,
      'descriptionKey': instance.descriptionKey,
      'modelPartId': instance.modelPartId,
      'voiceFile': instance.voiceFile,
      'position': instance.position,
    };
