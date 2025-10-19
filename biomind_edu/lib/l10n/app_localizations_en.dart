// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'BioMind EDU';

  @override
  String get lessonsTitle => 'Biology Lessons';

  @override
  String get noLessonsAvailable => 'No lessons available yet';

  @override
  String get checkBackSoon => 'Check back soon for exciting biology lessons!';

  @override
  String get failedToLoadLessons => 'Failed to load lessons';

  @override
  String get settings => 'Settings';

  @override
  String get lessonCellStructure => 'Cell Structure';

  @override
  String get lessonCellDescription =>
      'Explore the amazing world inside a living cell';

  @override
  String get lessonPlantLife => 'Plant Life';

  @override
  String get lessonPlantDescription => 'Discover how plants grow and make food';

  @override
  String get lessonHumanHeart => 'Human Heart';

  @override
  String get lessonHeartDescription =>
      'Learn how your heart pumps blood through your body';

  @override
  String get difficultyBeginner => 'Beginner';

  @override
  String get difficultyIntermediate => 'Intermediate';

  @override
  String get startLesson => 'Start Lesson';

  @override
  String get continueLesson => 'Continue Lesson';

  @override
  String get lessonCompleted => 'Lesson Completed!';

  @override
  String get interactiveTask => 'Interactive Task';

  @override
  String get dragToMatch => 'Drag to Match';

  @override
  String timeRemaining(int seconds) {
    return 'Time: ${seconds}s';
  }

  @override
  String get correct => 'Correct!';

  @override
  String get tryAgain => 'Try Again';

  @override
  String get assessment => 'Assessment';

  @override
  String question(int current, int total) {
    return 'Question $current of $total';
  }

  @override
  String get submit => 'Submit';

  @override
  String get next => 'Next';

  @override
  String get finish => 'Finish';

  @override
  String get results => 'Results';

  @override
  String get yourScore => 'Your Score';

  @override
  String scorePercentage(int score) {
    return '$score%';
  }

  @override
  String starsEarned(int stars) {
    return '$stars Stars';
  }

  @override
  String get excellent => 'Excellent!';

  @override
  String get greatJob => 'Great Job!';

  @override
  String get goodEffort => 'Good Effort!';

  @override
  String get keepPracticing => 'Keep Practicing!';

  @override
  String get rewards => 'Rewards';

  @override
  String get myRewards => 'My Rewards';

  @override
  String rewardsUnlocked(int count) {
    return '$count Rewards Unlocked';
  }

  @override
  String lessonsCompleted(int count) {
    return '$count Lessons';
  }

  @override
  String testsCompleted(int count) {
    return '$count Tests';
  }

  @override
  String get locked => 'Locked';

  @override
  String get unlocked => 'Unlocked!';

  @override
  String get congratulations => 'Congratulations!';

  @override
  String get newRewardUnlocked => 'New Reward Unlocked!';

  @override
  String get viewRewards => 'View Rewards';

  @override
  String get backToLessons => 'Back to Lessons';

  @override
  String get language => 'Language';

  @override
  String get english => 'English';

  @override
  String get ukrainian => 'Українська';

  @override
  String get progressTitle => 'Learning Progress';

  @override
  String get overallProgress => 'Overall Progress';

  @override
  String get averageScore => 'Avg Score';

  @override
  String get totalTime => 'Time';

  @override
  String get completionRate => 'Completion Rate';

  @override
  String get lessonHistory => 'Lesson History';

  @override
  String get testResults => 'Test Results';

  @override
  String get noLessonsYet => 'No lessons started yet';

  @override
  String get noTestsYet => 'No tests completed yet';

  @override
  String get completed => 'Completed';

  @override
  String get inProgress => 'In Progress';

  @override
  String get notStarted => 'Not Started';

  @override
  String get attempt => 'attempt';

  @override
  String get attempts => 'attempts';

  @override
  String get errorLoadingProgress => 'Error loading progress';

  @override
  String get errorLoadingHistory => 'Error loading history';

  @override
  String get errorLoadingResults => 'Error loading results';
}
