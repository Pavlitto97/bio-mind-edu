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

  @override
  String get lessonsCellTitle => 'Будова Клітини';

  @override
  String get lessonsCellDescription =>
      'Давай дослідимо крихітні будівельні блоки життя! Дізнайся, що всередині клітини.';

  @override
  String get lessonsCellPartsNucleus => 'Ядро';

  @override
  String get lessonsCellPartsNucleusDescription =>
      '🧠 Мозок Клітини\nЯдро - це командний центр! Воно керує клітиною і зберігає всі важливі інструкції (ДНК).';

  @override
  String get lessonsCellPartsMembrane => 'Клітинна Мембрана';

  @override
  String get lessonsCellPartsMembraneDescription =>
      '🛡️ Захисна Стіна\nМембрана - це як охоронець! Вона вирішує, що заходить і виходить з клітини, щоб тримати її в безпеці.';

  @override
  String get lessonsCellPartsMitochondria => 'Мітохондрії';

  @override
  String get lessonsCellPartsMitochondriaDescription =>
      '⚡ Електростанція\nМітохондрії - це крихітні батарейки! Вони виробляють енергію, щоб клітина могла працювати.';

  @override
  String get lessonsCellPartsCytoplasm => 'Цитоплазма';

  @override
  String get lessonsCellPartsCytoplasmDescription =>
      '🌊 Желе Всередині\nЦитоплазма - це як желе, що заповнює клітину! Всі інші частини плавають у ній.';

  @override
  String get lessonsCellObjectivesTitle => 'Чому ти навчишся';

  @override
  String get lessonsCellObjective1 => 'Що таке клітина і чому вона важлива';

  @override
  String get lessonsCellObjective2 =>
      'Познайомишся з ядром, мембраною, мітохондріями та цитоплазмою';

  @override
  String get lessonsCellObjective3 =>
      'Як кожна частина допомагає клітині працювати';

  @override
  String get lessonsCellStepsTitle => 'Кроки уроку';

  @override
  String get lessonsCellStep1 => 'Подивись на 3D-клітину та поверни її';

  @override
  String get lessonsCellStep2 =>
      'Натисни на сяючі точки, щоб дізнатись про частини';

  @override
  String get lessonsCellStep3 => 'Виконай міні-гру: з\'єднай частини з назвами';

  @override
  String get lessonsCellStep4 => 'Пройди маленький тест і отримай наліпку!';

  @override
  String get lessonsPlantTitle => 'Життя Рослин';

  @override
  String get lessonsPlantDescription =>
      'Як ростуть рослини? Давай відкриємо дивовижні частини, які допомагають рослинам жити!';

  @override
  String get lessonsPlantPartsRoots => 'Коріння';

  @override
  String get lessonsPlantPartsRootsDescription =>
      '🌱 Підземні Помічники\nКоріння п\'є воду з землі і тримає рослину на місці, як якір!';

  @override
  String get lessonsPlantPartsStem => 'Стебло';

  @override
  String get lessonsPlantPartsStemDescription =>
      '🎋 Дорога\nСтебло - це як трубочка! Воно переносить воду і їжу між корінням і листям.';

  @override
  String get lessonsPlantPartsLeaves => 'Листя';

  @override
  String get lessonsPlantPartsLeavesDescription =>
      '🍃 Фабрика Їжі\nЛистя використовує сонячне світло, щоб зробити їжу для рослини! Це називається фотосинтез.';

  @override
  String get lessonsHeartTitle => 'Людське Серце';

  @override
  String get lessonsHeartDescription =>
      'Твоє серце - це дивовижна помпа! Подивимось, як воно качає кров по всьому тілу.';

  @override
  String get lessonsHeartPartsLeftAtrium => 'Ліве Передсердя';

  @override
  String get lessonsHeartPartsLeftAtriumDescription =>
      '📥 Верхня Ліва Камера\nЦя кімната отримує свіжу кров з киснем з легенів!';

  @override
  String get lessonsHeartPartsLeftVentricle => 'Лівий Шлуночок';

  @override
  String get lessonsHeartPartsLeftVentricleDescription =>
      '💪 Сильна Помпа\nНайсильніша частина! Вона качає кров по всьому тілу.';

  @override
  String get lessonsHeartPartsRightAtrium => 'Праве Передсердя';

  @override
  String get lessonsHeartPartsRightAtriumDescription =>
      '📥 Верхня Права Камера\nЦя кімната отримує кров, якій потрібен свіжий кисень з твого тіла.';

  @override
  String get lessonsHeartPartsRightVentricle => 'Правий Шлуночок';

  @override
  String get lessonsHeartPartsRightVentricleDescription =>
      '🫁 Легенева Помпа\nВона качає кров до легенів, щоб отримати свіжий кисень!';
}
