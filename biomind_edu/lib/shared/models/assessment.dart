import 'package:freezed_annotation/freezed_annotation.dart';

part 'assessment.freezed.dart';
part 'assessment.g.dart';

/// Question type
enum QuestionType {
  @JsonValue('multiple_choice')
  multipleChoice,
  
  @JsonValue('true_false')
  trueFalse,
  
  @JsonValue('image_select')
  imageSelect,
}

/// Assessment test entity
@freezed
class AssessmentTest with _$AssessmentTest {
  const factory AssessmentTest({
    /// Test ID
    required String id,
    
    /// Test title (localized key)
    required String titleKey,
    
    /// Test questions
    required List<Question> questions,
    
    /// Passing score (0.0 - 1.0)
    @Default(0.8) double passingScore,
    
    /// Time limit in seconds (null = no limit)
    int? timeLimitSeconds,
    
    /// Reward ID for passing
    String? rewardId,
  }) = _AssessmentTest;

  factory AssessmentTest.fromJson(Map<String, dynamic> json) =>
      _$AssessmentTestFromJson(json);
}

/// Test question
@freezed
class Question with _$Question {
  const factory Question({
    /// Question ID
    required String id,
    
    /// Question text (localized key)
    required String questionKey,
    
    /// Question type
    required QuestionType type,
    
    /// Answer options
    required List<AnswerOption> options,
    
    /// Correct answer ID(s)
    required List<String> correctAnswerIds,
    
    /// Question image path
    String? imagePath,
    
    /// Voice question file
    String? voiceFile,
    
    /// Explanation (localized key)
    String? explanationKey,
    
    /// Points for correct answer
    @Default(1) int points,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}

/// Answer option
@freezed
class AnswerOption with _$AnswerOption {
  const factory AnswerOption({
    /// Option ID
    required String id,
    
    /// Option text (localized key)
    required String textKey,
    
    /// Option image path
    String? imagePath,
    
    /// Option icon name
    String? iconName,
  }) = _AnswerOption;

  factory AnswerOption.fromJson(Map<String, dynamic> json) =>
      _$AnswerOptionFromJson(json);
}

/// Test result
@freezed
class TestResult with _$TestResult {
  const factory TestResult({
    /// Test ID
    required String testId,
    
    /// User answers (questionId -> answerId)
    required Map<String, List<String>> userAnswers,
    
    /// Correct answers count
    required int correctCount,
    
    /// Total questions count
    required int totalCount,
    
    /// Score (0.0 - 1.0)
    required double score,
    
    /// Is passed
    required bool isPassed,
    
    /// Time taken in seconds
    required int timeTakenSeconds,
    
    /// Completion timestamp
    required DateTime completedAt,
    
    /// Detailed results per question
    @Default([]) List<QuestionResult> questionResults,
  }) = _TestResult;

  factory TestResult.fromJson(Map<String, dynamic> json) =>
      _$TestResultFromJson(json);
}

/// Individual question result
@freezed
class QuestionResult with _$QuestionResult {
  const factory QuestionResult({
    /// Question ID
    required String questionId,
    
    /// User answer IDs
    required List<String> userAnswerIds,
    
    /// Correct answer IDs
    required List<String> correctAnswerIds,
    
    /// Is correct
    required bool isCorrect,
    
    /// Points earned
    required int pointsEarned,
  }) = _QuestionResult;

  factory QuestionResult.fromJson(Map<String, dynamic> json) =>
      _$QuestionResultFromJson(json);
}
