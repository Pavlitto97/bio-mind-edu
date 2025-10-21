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

  @override
  String get lessonsCellTitle => 'Cell Structure';

  @override
  String get lessonsCellDescription =>
      '🔬 Journey inside a cell! Meet the nucleus-brain, membrane-guard, and mitochondria-batteries. Take apart the cell and discover how all parts work together! Fun and simple for little explorers! ✨';

  @override
  String get lessonsCellPartsNucleus => 'Nucleus';

  @override
  String get lessonsCellPartsNucleusDescription =>
      '🧠 The Brain of the Cell\nThe nucleus is like the control center! It tells the cell what to do and stores all the important instructions (DNA).';

  @override
  String get lessonsCellPartsMembrane => 'Cell Membrane';

  @override
  String get lessonsCellPartsMembraneDescription =>
      '🛡️ The Protective Wall\nThe membrane is like a bouncer at a club! It decides what goes in and out of the cell to keep it safe.';

  @override
  String get lessonsCellPartsMitochondria => 'Mitochondria';

  @override
  String get lessonsCellPartsMitochondriaDescription =>
      '⚡ The Power Plant\nMitochondria are like tiny batteries! They make energy so the cell can work and stay alive.';

  @override
  String get lessonsCellPartsCytoplasm => 'Cytoplasm';

  @override
  String get lessonsCellPartsCytoplasmDescription =>
      '🌊 The Jelly Inside\nCytoplasm is like jelly that fills the cell! All the other parts float around in it.';

  @override
  String get lessonsCellObjectivesTitle => 'What you\'ll learn';

  @override
  String get lessonsCellObjective1 => 'What a cell is and why it\'s important';

  @override
  String get lessonsCellObjective2 =>
      'Meet the nucleus, membrane, mitochondria, and cytoplasm';

  @override
  String get lessonsCellObjective3 => 'How each part helps the cell do its job';

  @override
  String get lessonsCellStepsTitle => 'Lesson steps';

  @override
  String get lessonsCellStep1 => 'Look at the 3D cell and rotate it';

  @override
  String get lessonsCellStep2 =>
      'Tap each glowing dot to learn about that part';

  @override
  String get lessonsCellStep3 => 'Complete the mini-game: match parts to names';

  @override
  String get lessonsCellStep4 => 'Take a tiny quiz to earn your sticker!';

  @override
  String get lessonsPlantTitle => 'Plant Life';

  @override
  String get lessonsPlantDescription =>
      '🌱 Green wonders all around! Learn how roots drink water, stems carry food, and leaves make magic with sunshine. Build a plant from parts and become a real botanist! 🌿✨';

  @override
  String get lessonsPlantPartsSeed => 'Seed';

  @override
  String get lessonsPlantPartsSeedDescription =>
      '� Tiny Beginning\nEvery plant starts as a tiny seed! Inside is a baby plant waiting to grow with water and sunshine.';

  @override
  String get lessonsPlantPartsSprout => 'Sprout';

  @override
  String get lessonsPlantPartsSproutDescription =>
      '🌱 First Hello!\nThe seed cracks open and a tiny green sprout pops out! It\'s reaching up to find the sunlight.';

  @override
  String get lessonsPlantPartsGrowth => 'Growth';

  @override
  String get lessonsPlantPartsGrowthDescription =>
      '� Getting Bigger!\nThe plant grows taller and stronger! Leaves open up to catch sunlight and make food. Roots dig deeper for water.';

  @override
  String get lessonsPlantPartsBloom => 'Bloom';

  @override
  String get lessonsPlantPartsBloomDescription =>
      '� Beautiful Flowers!\nThe plant makes colorful flowers! Flowers help make new seeds so more plants can grow. It\'s the circle of life! ✨';

  @override
  String get lessonsHeartTitle => 'Human Heart';

  @override
  String get lessonsHeartDescription =>
      '❤️ Your heart is a super muscle! It pumps blood day and night to deliver oxygen to every part of your body. Explore chambers, valves and learn how this amazing pump of life works! 💓🩺';

  @override
  String get lessonsHeartPartsLeftAtrium => 'Left Atrium';

  @override
  String get lessonsHeartPartsLeftAtriumDescription =>
      '📥 Top Left Chamber\nThis room receives fresh oxygen-rich blood from the lungs!';

  @override
  String get lessonsHeartPartsLeftVentricle => 'Left Ventricle';

  @override
  String get lessonsHeartPartsLeftVentricleDescription =>
      '💪 Strong Pump\nThe strongest part! It pumps blood to your whole body.';

  @override
  String get lessonsHeartPartsRightAtrium => 'Right Atrium';

  @override
  String get lessonsHeartPartsRightAtriumDescription =>
      '📥 Top Right Chamber\nThis room receives blood that needs fresh oxygen from your body.';

  @override
  String get lessonsHeartPartsRightVentricle => 'Right Ventricle';

  @override
  String get lessonsHeartPartsRightVentricleDescription =>
      '🫁 Lung Pump\nThis pumps blood to your lungs to get fresh oxygen!';
}
