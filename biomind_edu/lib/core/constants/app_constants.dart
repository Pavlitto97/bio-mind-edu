// ignore_for_file: dangling_library_doc_comments

/// Core constants for BioMindEDU application
library;

/// App information
class AppConstants {
  static const String appName = 'BioMindEDU';
  static const String appVersion = '1.0.0';
  static const String appDescription = 'AR educational app for kids 3-8 years old';
}

/// AR configuration constants
class ARConstants {
  /// Minimum FPS for AR rendering
  static const int minFps = 30;
  
  /// Maximum loading time for AR scene (seconds)
  static const int maxLoadingTime = 5;
  
  /// Maximum memory usage (MB)
  static const int maxMemoryUsage = 200;
  
  /// Default plane detection modes
  static const bool detectHorizontalPlanes = true;
  static const bool detectVerticalPlanes = true;
  
  /// AR object scale limits
  static const double minScale = 0.1;
  static const double maxScale = 5.0;
  static const double defaultScale = 1.0;
}

/// 3D model configuration
class ModelConstants {
  /// Maximum polygon count for 3D models
  static const int maxPolygonCount = 50000;
  
  /// Supported 3D model formats
  static const List<String> supportedFormats = ['gltf', 'glb'];
  
  /// Model base path
  static const String modelsPath = 'assets/3d_models/';
  
  /// Model names
  static const String cellModel = 'cell.glb';
  static const String plantModel = 'plant.glb';
  static const String heartModel = 'heart.glb';
}

/// Audio configuration
class AudioConstants {
  /// Audio base path
  static const String audioPath = 'assets/audio/';
  
  /// Supported audio formats
  static const List<String> supportedFormats = ['mp3', 'aac', 'ogg'];
  
  /// Audio volume (0.0 - 1.0)
  static const double defaultVolume = 0.8;
  
  /// Audio categories
  static const String voiceInstructions = 'voice/';
  static const String soundEffects = 'sfx/';
  static const String backgroundMusic = 'music/';
}

/// Storage configuration
class StorageConstants {
  /// Hive box names
  static const String lessonsBox = 'lessons';
  static const String progressBox = 'progress';
  static const String rewardsBox = 'rewards';
  static const String settingsBox = 'settings';
  
  /// Preference keys
  static const String languageKey = 'language';
  static const String soundEnabledKey = 'sound_enabled';
  static const String firstLaunchKey = 'first_launch';
}

/// UI configuration
class UIConstants {
  /// Minimum touch target size (for children)
  static const double minTouchTarget = 48.0;
  
  /// Animation duration (milliseconds)
  static const int shortAnimationDuration = 300;
  static const int mediumAnimationDuration = 500;
  static const int longAnimationDuration = 1000;
  
  /// Padding and spacing
  static const double smallPadding = 8.0;
  static const double mediumPadding = 16.0;
  static const double largePadding = 24.0;
  
  /// Border radius
  static const double smallRadius = 8.0;
  static const double mediumRadius = 16.0;
  static const double largeRadius = 24.0;
}

/// Performance thresholds
class PerformanceConstants {
  /// Target FPS
  static const int targetFps = 60;
  
  /// Low FPS threshold
  static const int lowFpsThreshold = 30;
  
  /// Memory warning threshold (MB)
  static const int memoryWarningThreshold = 150;
  
  /// Max app size (MB)
  static const int maxAppSize = 150;
}

/// API and Firebase configuration
class ApiConstants {
  /// API timeout (seconds)
  static const int apiTimeout = 30;
  
  /// Max retry attempts
  static const int maxRetryAttempts = 3;
  
  /// Firebase collection names
  static const String lessonsCollection = 'lessons';
  static const String usersCollection = 'users';
  static const String progressCollection = 'progress';
}

/// Lesson configuration
class LessonConstants {
  /// Available lesson IDs
  static const String cellLesson = 'cell';
  static const String plantLesson = 'plant';
  static const String heartLesson = 'heart';
  
  /// Lesson duration (minutes)
  static const int minLessonDuration = 10;
  static const int maxLessonDuration = 15;
  
  /// Test configuration
  static const int minTestQuestions = 5;
  static const int maxTestQuestions = 7;
  static const double passingScore = 0.8; // 80%
}

/// Age group configuration
class AgeGroupConstants {
  /// Age group 1: 3-5 years
  static const int ageGroup1Min = 3;
  static const int ageGroup1Max = 5;
  
  /// Age group 2: 6-8 years
  static const int ageGroup2Min = 6;
  static const int ageGroup2Max = 8;
}

/// Localization
class LocaleConstants {
  static const String english = 'en';
  static const String ukrainian = 'uk';
  
  static const List<String> supportedLocales = [english, ukrainian];
  static const String defaultLocale = english;
}
