// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appTitle => 'BioMind EDU';

  @override
  String get lessonsTitle => 'Уроки біології';

  @override
  String get noLessonsAvailable => 'Уроків поки немає';

  @override
  String get checkBackSoon => 'Незабаром з\'являться цікаві уроки біології!';

  @override
  String get failedToLoadLessons => 'Не вдалося завантажити уроки';

  @override
  String get settings => 'Налаштування';

  @override
  String get lessonCellStructure => 'Будова клітини';

  @override
  String get lessonCellDescription =>
      'Досліджуй дивовижний світ всередині живої клітини';

  @override
  String get lessonPlantLife => 'Життя рослин';

  @override
  String get lessonPlantDescription =>
      'Дізнайся, як рослини ростуть і виробляють їжу';

  @override
  String get lessonHumanHeart => 'Серце людини';

  @override
  String get lessonHeartDescription =>
      'Дізнайся, як твоє серце перекачує кров по тілу';

  @override
  String get difficultyBeginner => 'Початковий';

  @override
  String get difficultyIntermediate => 'Середній';

  @override
  String get startLesson => 'Почати урок';

  @override
  String get continueLesson => 'Продовжити урок';

  @override
  String get lessonCompleted => 'Урок завершено!';

  @override
  String get interactiveTask => 'Інтерактивне завдання';

  @override
  String get dragToMatch => 'Перетягни для з\'єднання';

  @override
  String timeRemaining(int seconds) {
    return 'Час: $secondsс';
  }

  @override
  String get correct => 'Правильно!';

  @override
  String get tryAgain => 'Спробуй ще раз';

  @override
  String get assessment => 'Оцінювання';

  @override
  String question(int current, int total) {
    return 'Питання $current з $total';
  }

  @override
  String get submit => 'Надіслати';

  @override
  String get next => 'Далі';

  @override
  String get finish => 'Завершити';

  @override
  String get results => 'Результати';

  @override
  String get yourScore => 'Твій результат';

  @override
  String scorePercentage(int score) {
    return '$score%';
  }

  @override
  String starsEarned(int stars) {
    return '$stars зірок';
  }

  @override
  String get excellent => 'Чудово!';

  @override
  String get greatJob => 'Відмінна робота!';

  @override
  String get goodEffort => 'Добре!';

  @override
  String get keepPracticing => 'Продовжуй вправлятися!';

  @override
  String get rewards => 'Нагороди';

  @override
  String get myRewards => 'Мої нагороди';

  @override
  String rewardsUnlocked(int count) {
    return 'Нагороди відкрито: $count';
  }

  @override
  String lessonsCompleted(int count) {
    return 'Уроків: $count';
  }

  @override
  String testsCompleted(int count) {
    return 'Тестів: $count';
  }

  @override
  String get locked => 'Заблоковано';

  @override
  String get unlocked => 'Відкрито!';

  @override
  String get congratulations => 'Вітаємо!';

  @override
  String get newRewardUnlocked => 'Нова нагорода відкрита!';

  @override
  String get viewRewards => 'Переглянути нагороди';

  @override
  String get backToLessons => 'Назад до уроків';

  @override
  String get language => 'Мова';

  @override
  String get english => 'English';

  @override
  String get ukrainian => 'Українська';

  @override
  String get progressTitle => 'Прогрес навчання';

  @override
  String get overallProgress => 'Загальний прогрес';

  @override
  String get averageScore => 'Середній бал';

  @override
  String get totalTime => 'Час';

  @override
  String get completionRate => 'Рівень завершення';

  @override
  String get lessonHistory => 'Історія уроків';

  @override
  String get testResults => 'Результати тестів';

  @override
  String get noLessonsYet => 'Ще не розпочато жодного уроку';

  @override
  String get noTestsYet => 'Ще не завершено жодного тесту';

  @override
  String get completed => 'Завершено';

  @override
  String get inProgress => 'Виконується';

  @override
  String get notStarted => 'Не розпочато';

  @override
  String get attempt => 'спроба';

  @override
  String get attempts => 'спроб';

  @override
  String get errorLoadingProgress => 'Помилка завантаження прогресу';

  @override
  String get errorLoadingHistory => 'Помилка завантаження історії';

  @override
  String get errorLoadingResults => 'Помилка завантаження результатів';
}
