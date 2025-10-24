// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assessment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AssessmentTestImpl _$$AssessmentTestImplFromJson(Map<String, dynamic> json) =>
    _$AssessmentTestImpl(
      id: json['id'] as String,
      titleKey: json['titleKey'] as String,
      questions: (json['questions'] as List<dynamic>)
          .map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
      passingScore: (json['passingScore'] as num?)?.toDouble() ?? 0.8,
      timeLimitSeconds: (json['timeLimitSeconds'] as num?)?.toInt(),
      rewardId: json['rewardId'] as String?,
    );

Map<String, dynamic> _$$AssessmentTestImplToJson(
        _$AssessmentTestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'titleKey': instance.titleKey,
      'questions': instance.questions,
      'passingScore': instance.passingScore,
      'timeLimitSeconds': instance.timeLimitSeconds,
      'rewardId': instance.rewardId,
    };

_$QuestionImpl _$$QuestionImplFromJson(Map<String, dynamic> json) =>
    _$QuestionImpl(
      id: json['id'] as String,
      questionKey: json['questionKey'] as String,
      type: $enumDecode(_$QuestionTypeEnumMap, json['type']),
      options: (json['options'] as List<dynamic>)
          .map((e) => AnswerOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      correctAnswerIds: (json['correctAnswerIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      imagePath: json['imagePath'] as String?,
      voiceFile: json['voiceFile'] as String?,
      explanationKey: json['explanationKey'] as String?,
      points: (json['points'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$$QuestionImplToJson(_$QuestionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'questionKey': instance.questionKey,
      'type': _$QuestionTypeEnumMap[instance.type]!,
      'options': instance.options,
      'correctAnswerIds': instance.correctAnswerIds,
      'imagePath': instance.imagePath,
      'voiceFile': instance.voiceFile,
      'explanationKey': instance.explanationKey,
      'points': instance.points,
    };

const _$QuestionTypeEnumMap = {
  QuestionType.multipleChoice: 'multiple_choice',
  QuestionType.trueFalse: 'true_false',
  QuestionType.imageSelect: 'image_select',
};

_$AnswerOptionImpl _$$AnswerOptionImplFromJson(Map<String, dynamic> json) =>
    _$AnswerOptionImpl(
      id: json['id'] as String,
      textKey: json['textKey'] as String,
      imagePath: json['imagePath'] as String?,
      iconName: json['iconName'] as String?,
    );

Map<String, dynamic> _$$AnswerOptionImplToJson(_$AnswerOptionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'textKey': instance.textKey,
      'imagePath': instance.imagePath,
      'iconName': instance.iconName,
    };

_$TestResultImpl _$$TestResultImplFromJson(Map<String, dynamic> json) =>
    _$TestResultImpl(
      testId: json['testId'] as String,
      userAnswers: (json['userAnswers'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
      correctCount: (json['correctCount'] as num).toInt(),
      totalCount: (json['totalCount'] as num).toInt(),
      score: (json['score'] as num).toDouble(),
      isPassed: json['isPassed'] as bool,
      timeTakenSeconds: (json['timeTakenSeconds'] as num).toInt(),
      completedAt: DateTime.parse(json['completedAt'] as String),
      questionResults: (json['questionResults'] as List<dynamic>?)
              ?.map((e) => QuestionResult.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TestResultImplToJson(_$TestResultImpl instance) =>
    <String, dynamic>{
      'testId': instance.testId,
      'userAnswers': instance.userAnswers,
      'correctCount': instance.correctCount,
      'totalCount': instance.totalCount,
      'score': instance.score,
      'isPassed': instance.isPassed,
      'timeTakenSeconds': instance.timeTakenSeconds,
      'completedAt': instance.completedAt.toIso8601String(),
      'questionResults': instance.questionResults,
    };

_$QuestionResultImpl _$$QuestionResultImplFromJson(Map<String, dynamic> json) =>
    _$QuestionResultImpl(
      questionId: json['questionId'] as String,
      userAnswerIds: (json['userAnswerIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      correctAnswerIds: (json['correctAnswerIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      isCorrect: json['isCorrect'] as bool,
      pointsEarned: (json['pointsEarned'] as num).toInt(),
    );

Map<String, dynamic> _$$QuestionResultImplToJson(
        _$QuestionResultImpl instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'userAnswerIds': instance.userAnswerIds,
      'correctAnswerIds': instance.correctAnswerIds,
      'isCorrect': instance.isCorrect,
      'pointsEarned': instance.pointsEarned,
    };
