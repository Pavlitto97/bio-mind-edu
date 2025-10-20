import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_uk.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('uk'),
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'BioMind EDU'**
  String get appTitle;

  /// Title for lessons list page
  ///
  /// In en, this message translates to:
  /// **'Biology Lessons'**
  String get lessonsTitle;

  /// Message when no lessons are found
  ///
  /// In en, this message translates to:
  /// **'No lessons available yet'**
  String get noLessonsAvailable;

  /// Encouragement message for empty lessons
  ///
  /// In en, this message translates to:
  /// **'Check back soon for exciting biology lessons!'**
  String get checkBackSoon;

  /// Error message when lessons fail to load
  ///
  /// In en, this message translates to:
  /// **'Failed to load lessons'**
  String get failedToLoadLessons;

  /// Settings menu item
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// Title for cell structure lesson
  ///
  /// In en, this message translates to:
  /// **'Cell Structure'**
  String get lessonCellStructure;

  /// Description for cell structure lesson
  ///
  /// In en, this message translates to:
  /// **'Explore the amazing world inside a living cell'**
  String get lessonCellDescription;

  /// Title for plant life lesson
  ///
  /// In en, this message translates to:
  /// **'Plant Life'**
  String get lessonPlantLife;

  /// Description for plant life lesson
  ///
  /// In en, this message translates to:
  /// **'Discover how plants grow and make food'**
  String get lessonPlantDescription;

  /// Title for human heart lesson
  ///
  /// In en, this message translates to:
  /// **'Human Heart'**
  String get lessonHumanHeart;

  /// Description for human heart lesson
  ///
  /// In en, this message translates to:
  /// **'Learn how your heart pumps blood through your body'**
  String get lessonHeartDescription;

  /// Beginner difficulty level
  ///
  /// In en, this message translates to:
  /// **'Beginner'**
  String get difficultyBeginner;

  /// Intermediate difficulty level
  ///
  /// In en, this message translates to:
  /// **'Intermediate'**
  String get difficultyIntermediate;

  /// Button to start a lesson
  ///
  /// In en, this message translates to:
  /// **'Start Lesson'**
  String get startLesson;

  /// Button to continue an in-progress lesson
  ///
  /// In en, this message translates to:
  /// **'Continue Lesson'**
  String get continueLesson;

  /// Message when lesson is completed
  ///
  /// In en, this message translates to:
  /// **'Lesson Completed!'**
  String get lessonCompleted;

  /// Title for interactive task section
  ///
  /// In en, this message translates to:
  /// **'Interactive Task'**
  String get interactiveTask;

  /// Instructions for drag-and-drop task
  ///
  /// In en, this message translates to:
  /// **'Drag to Match'**
  String get dragToMatch;

  /// Time remaining in task
  ///
  /// In en, this message translates to:
  /// **'Time: {seconds}s'**
  String timeRemaining(int seconds);

  /// Feedback for correct answer
  ///
  /// In en, this message translates to:
  /// **'Correct!'**
  String get correct;

  /// Feedback for incorrect answer
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get tryAgain;

  /// Title for assessment section
  ///
  /// In en, this message translates to:
  /// **'Assessment'**
  String get assessment;

  /// Question progress indicator
  ///
  /// In en, this message translates to:
  /// **'Question {current} of {total}'**
  String question(int current, int total);

  /// Submit button
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// Next button
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// Finish button
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get finish;

  /// Results page title
  ///
  /// In en, this message translates to:
  /// **'Results'**
  String get results;

  /// Score label
  ///
  /// In en, this message translates to:
  /// **'Your Score'**
  String get yourScore;

  /// Score percentage
  ///
  /// In en, this message translates to:
  /// **'{score}%'**
  String scorePercentage(int score);

  /// Stars earned
  ///
  /// In en, this message translates to:
  /// **'{stars} Stars'**
  String starsEarned(int stars);

  /// Feedback for excellent performance
  ///
  /// In en, this message translates to:
  /// **'Excellent!'**
  String get excellent;

  /// Feedback for good performance
  ///
  /// In en, this message translates to:
  /// **'Great Job!'**
  String get greatJob;

  /// Feedback for passing performance
  ///
  /// In en, this message translates to:
  /// **'Good Effort!'**
  String get goodEffort;

  /// Feedback for poor performance
  ///
  /// In en, this message translates to:
  /// **'Keep Practicing!'**
  String get keepPracticing;

  /// Rewards page title
  ///
  /// In en, this message translates to:
  /// **'Rewards'**
  String get rewards;

  /// My rewards collection title
  ///
  /// In en, this message translates to:
  /// **'My Rewards'**
  String get myRewards;

  /// Rewards unlocked count
  ///
  /// In en, this message translates to:
  /// **'{count} Rewards Unlocked'**
  String rewardsUnlocked(int count);

  /// Lessons completed count
  ///
  /// In en, this message translates to:
  /// **'{count} Lessons'**
  String lessonsCompleted(int count);

  /// Tests completed count
  ///
  /// In en, this message translates to:
  /// **'{count} Tests'**
  String testsCompleted(int count);

  /// Status for locked items
  ///
  /// In en, this message translates to:
  /// **'Locked'**
  String get locked;

  /// Status for newly unlocked items
  ///
  /// In en, this message translates to:
  /// **'Unlocked!'**
  String get unlocked;

  /// Congratulations message
  ///
  /// In en, this message translates to:
  /// **'Congratulations!'**
  String get congratulations;

  /// Message when a new reward is unlocked
  ///
  /// In en, this message translates to:
  /// **'New Reward Unlocked!'**
  String get newRewardUnlocked;

  /// Button to view rewards collection
  ///
  /// In en, this message translates to:
  /// **'View Rewards'**
  String get viewRewards;

  /// Button to return to lessons
  ///
  /// In en, this message translates to:
  /// **'Back to Lessons'**
  String get backToLessons;

  /// Language settings
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// English language option
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// Ukrainian language option
  ///
  /// In en, this message translates to:
  /// **'Українська'**
  String get ukrainian;

  /// Title for progress page
  ///
  /// In en, this message translates to:
  /// **'Learning Progress'**
  String get progressTitle;

  /// Overall progress section title
  ///
  /// In en, this message translates to:
  /// **'Overall Progress'**
  String get overallProgress;

  /// Average score label
  ///
  /// In en, this message translates to:
  /// **'Avg Score'**
  String get averageScore;

  /// Total time label
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get totalTime;

  /// Completion rate label
  ///
  /// In en, this message translates to:
  /// **'Completion Rate'**
  String get completionRate;

  /// Lesson history section title
  ///
  /// In en, this message translates to:
  /// **'Lesson History'**
  String get lessonHistory;

  /// Test results section title
  ///
  /// In en, this message translates to:
  /// **'Test Results'**
  String get testResults;

  /// Message when no lesson history
  ///
  /// In en, this message translates to:
  /// **'No lessons started yet'**
  String get noLessonsYet;

  /// Message when no test results
  ///
  /// In en, this message translates to:
  /// **'No tests completed yet'**
  String get noTestsYet;

  /// Completed status
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// In progress status
  ///
  /// In en, this message translates to:
  /// **'In Progress'**
  String get inProgress;

  /// Not started status
  ///
  /// In en, this message translates to:
  /// **'Not Started'**
  String get notStarted;

  /// Singular attempt
  ///
  /// In en, this message translates to:
  /// **'attempt'**
  String get attempt;

  /// Plural attempts
  ///
  /// In en, this message translates to:
  /// **'attempts'**
  String get attempts;

  /// Error message for progress loading
  ///
  /// In en, this message translates to:
  /// **'Error loading progress'**
  String get errorLoadingProgress;

  /// Error message for history loading
  ///
  /// In en, this message translates to:
  /// **'Error loading history'**
  String get errorLoadingHistory;

  /// Error message for results loading
  ///
  /// In en, this message translates to:
  /// **'Error loading results'**
  String get errorLoadingResults;

  /// Title for cell lesson
  ///
  /// In en, this message translates to:
  /// **'Cell Structure'**
  String get lessonsCellTitle;

  /// Description for cell lesson
  ///
  /// In en, this message translates to:
  /// **'Let\'s explore the tiny building blocks of life! Discover what\'s inside a cell.'**
  String get lessonsCellDescription;

  /// Cell part: nucleus
  ///
  /// In en, this message translates to:
  /// **'Nucleus'**
  String get lessonsCellPartsNucleus;

  /// Description of nucleus for kids
  ///
  /// In en, this message translates to:
  /// **'🧠 The Brain of the Cell\nThe nucleus is like the control center! It tells the cell what to do and stores all the important instructions (DNA).'**
  String get lessonsCellPartsNucleusDescription;

  /// Cell part: membrane
  ///
  /// In en, this message translates to:
  /// **'Cell Membrane'**
  String get lessonsCellPartsMembrane;

  /// Description of membrane for kids
  ///
  /// In en, this message translates to:
  /// **'🛡️ The Protective Wall\nThe membrane is like a bouncer at a club! It decides what goes in and out of the cell to keep it safe.'**
  String get lessonsCellPartsMembraneDescription;

  /// Cell part: mitochondria
  ///
  /// In en, this message translates to:
  /// **'Mitochondria'**
  String get lessonsCellPartsMitochondria;

  /// Description of mitochondria for kids
  ///
  /// In en, this message translates to:
  /// **'⚡ The Power Plant\nMitochondria are like tiny batteries! They make energy so the cell can work and stay alive.'**
  String get lessonsCellPartsMitochondriaDescription;

  /// Cell part: cytoplasm
  ///
  /// In en, this message translates to:
  /// **'Cytoplasm'**
  String get lessonsCellPartsCytoplasm;

  /// Description of cytoplasm for kids
  ///
  /// In en, this message translates to:
  /// **'🌊 The Jelly Inside\nCytoplasm is like jelly that fills the cell! All the other parts float around in it.'**
  String get lessonsCellPartsCytoplasmDescription;

  /// Section title for lesson objectives
  ///
  /// In en, this message translates to:
  /// **'What you\'ll learn'**
  String get lessonsCellObjectivesTitle;

  /// First objective for the cell lesson
  ///
  /// In en, this message translates to:
  /// **'What a cell is and why it\'s important'**
  String get lessonsCellObjective1;

  /// Second objective for the cell lesson
  ///
  /// In en, this message translates to:
  /// **'Meet the nucleus, membrane, mitochondria, and cytoplasm'**
  String get lessonsCellObjective2;

  /// Third objective for the cell lesson
  ///
  /// In en, this message translates to:
  /// **'How each part helps the cell do its job'**
  String get lessonsCellObjective3;

  /// Section title for lesson steps
  ///
  /// In en, this message translates to:
  /// **'Lesson steps'**
  String get lessonsCellStepsTitle;

  /// First step for the cell lesson
  ///
  /// In en, this message translates to:
  /// **'Look at the 3D cell and rotate it'**
  String get lessonsCellStep1;

  /// Second step for the cell lesson
  ///
  /// In en, this message translates to:
  /// **'Tap each glowing dot to learn about that part'**
  String get lessonsCellStep2;

  /// Third step for the cell lesson
  ///
  /// In en, this message translates to:
  /// **'Complete the mini-game: match parts to names'**
  String get lessonsCellStep3;

  /// Fourth step for the cell lesson
  ///
  /// In en, this message translates to:
  /// **'Take a tiny quiz to earn your sticker!'**
  String get lessonsCellStep4;

  /// Title for plant lesson
  ///
  /// In en, this message translates to:
  /// **'Plant Life'**
  String get lessonsPlantTitle;

  /// Description for plant lesson
  ///
  /// In en, this message translates to:
  /// **'How do plants grow? Let\'s discover the amazing parts that help plants live and grow!'**
  String get lessonsPlantDescription;

  /// Plant part: roots
  ///
  /// In en, this message translates to:
  /// **'Roots'**
  String get lessonsPlantPartsRoots;

  /// Description of roots for kids
  ///
  /// In en, this message translates to:
  /// **'🌱 Underground Helpers\nRoots drink water from the soil and hold the plant in place, like an anchor!'**
  String get lessonsPlantPartsRootsDescription;

  /// Plant part: stem
  ///
  /// In en, this message translates to:
  /// **'Stem'**
  String get lessonsPlantPartsStem;

  /// Description of stem for kids
  ///
  /// In en, this message translates to:
  /// **'🎋 The Highway\nThe stem is like a straw! It carries water and food between the roots and leaves.'**
  String get lessonsPlantPartsStemDescription;

  /// Plant part: leaves
  ///
  /// In en, this message translates to:
  /// **'Leaves'**
  String get lessonsPlantPartsLeaves;

  /// Description of leaves for kids
  ///
  /// In en, this message translates to:
  /// **'🍃 The Food Factory\nLeaves use sunlight to make food for the plant! This is called photosynthesis.'**
  String get lessonsPlantPartsLeavesDescription;

  /// Title for heart lesson
  ///
  /// In en, this message translates to:
  /// **'Human Heart'**
  String get lessonsHeartTitle;

  /// Description for heart lesson
  ///
  /// In en, this message translates to:
  /// **'Your heart is an amazing pump! Let\'s see how it sends blood all around your body.'**
  String get lessonsHeartDescription;

  /// Heart part: left atrium
  ///
  /// In en, this message translates to:
  /// **'Left Atrium'**
  String get lessonsHeartPartsLeftAtrium;

  /// Description of left atrium for kids
  ///
  /// In en, this message translates to:
  /// **'📥 Top Left Chamber\nThis room receives fresh oxygen-rich blood from the lungs!'**
  String get lessonsHeartPartsLeftAtriumDescription;

  /// Heart part: left ventricle
  ///
  /// In en, this message translates to:
  /// **'Left Ventricle'**
  String get lessonsHeartPartsLeftVentricle;

  /// Description of left ventricle for kids
  ///
  /// In en, this message translates to:
  /// **'💪 Strong Pump\nThe strongest part! It pumps blood to your whole body.'**
  String get lessonsHeartPartsLeftVentricleDescription;

  /// Heart part: right atrium
  ///
  /// In en, this message translates to:
  /// **'Right Atrium'**
  String get lessonsHeartPartsRightAtrium;

  /// Description of right atrium for kids
  ///
  /// In en, this message translates to:
  /// **'📥 Top Right Chamber\nThis room receives blood that needs fresh oxygen from your body.'**
  String get lessonsHeartPartsRightAtriumDescription;

  /// Heart part: right ventricle
  ///
  /// In en, this message translates to:
  /// **'Right Ventricle'**
  String get lessonsHeartPartsRightVentricle;

  /// Description of right ventricle for kids
  ///
  /// In en, this message translates to:
  /// **'🫁 Lung Pump\nThis pumps blood to your lungs to get fresh oxygen!'**
  String get lessonsHeartPartsRightVentricleDescription;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'uk'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'uk':
      return AppLocalizationsUk();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
