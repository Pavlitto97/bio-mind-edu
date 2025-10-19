import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';
import 'core/services/local_storage_service.dart';

/// Main entry point for BioMindEDU application
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Load environment variables
  await dotenv.load(fileName: '.env');
  
  // Initialize Hive for local storage
  await Hive.initFlutter();
  
  // Initialize Local Storage Service
  await LocalStorageService().initialize();
  
  // TODO: Initialize Firebase when project is created
  // await Firebase.initializeApp();
  
  runApp(
    const ProviderScope(
      child: BioMindEduApp(),
    ),
  );
}
