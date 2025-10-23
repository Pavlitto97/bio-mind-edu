import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';
import 'core/services/local_storage_service.dart';
import 'core/services/audio_service.dart';
import 'features/rewards/data/models/reward_model.dart';
import 'features/profile/data/models/user_profile_model.dart';
import 'features/rewards/domain/reward_service.dart';
import 'shared/widgets/splash_screen.dart';
// import 'shared/data/sample_lesson_data.dart'; // Disabled for web demo

/// Main entry point for BioMindEDU application
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(
          initializeApp: _initializeApp,
          nextScreen: const BioMindEduApp(),
        ),
      ),
    ),
  );
}

/// Initialize all app services
Future<void> _initializeApp() async {
  try {
    // Load environment variables (only on non-web platforms)
    try {
      await dotenv.load(fileName: '.env');
    } catch (e) {
      debugPrint('Environment file not found (expected on web): $e');
    }

    // Initialize Hive for local storage
    await Hive.initFlutter();

    // Register Hive Type Adapters
    if (!Hive.isAdapterRegistered(4)) {
      Hive.registerAdapter(RewardAdapter());
    }
    if (!Hive.isAdapterRegistered(5)) {
      Hive.registerAdapter(RewardCategoryAdapter());
    }
    if (!Hive.isAdapterRegistered(6)) {
      Hive.registerAdapter(UserProfileAdapter());
    }

    // Initialize Local Storage Service
    final storage = LocalStorageService();
    await storage.initialize();

    // Initialize Reward Service
    final rewardService = RewardService();
    await rewardService.initialize();

    // Initialize Audio Service and start background music
    final audioService = AudioService();
    await audioService.initialize();
    await audioService.playMusic('background_music_main.mp3');
    debugPrint('🎵 Background music started');

    // Initialize sample lesson data for testing
    // TODO: Remove when actual lesson content is ready
    // TEMPORARILY DISABLED for web - Hive TypeAdapters needed
    // await SampleLessonData.initializeSampleData(storage.saveLesson);

    // TODO: Initialize Firebase when project is created
    // await Firebase.initializeApp();
  } catch (e, stackTrace) {
    debugPrint('Initialization error: $e');
    debugPrint('Stack trace: $stackTrace');
  }
}
