import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'l10n/app_localizations.dart';
import 'core/theme/app_theme.dart';
import 'features/ar_lesson/presentation/lessons_list_page.dart';
import 'features/ar_lesson/presentation/ar_lesson_page.dart';
import 'features/interactive_task/presentation/interactive_task_page.dart';
import 'features/assessment/presentation/assessment_page.dart';
import 'features/rewards/presentation/rewards_page.dart';

/// Main BioMindEDU application widget
class BioMindEduApp extends ConsumerWidget {
  const BioMindEduApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'BioMindEDU',
      debugShowCheckedModeBanner: false,

      // Localization
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('uk'), // Ukrainian
      ],

      theme: AppTheme.lightTheme,
      home: const LessonsListPage(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/ar-lesson':
            final lessonId = settings.arguments as String;
            return MaterialPageRoute(
              builder: (context) => ARLessonPage(lessonId: lessonId),
            );
          case '/interactive-task':
            final lessonId = settings.arguments as String;
            return MaterialPageRoute(
              builder: (context) => InteractiveTaskPage(
                taskId: 'cell_drag_drop', // Mock task ID
                lessonId: lessonId,
              ),
            );
          case '/assessment':
            final args = settings.arguments as Map<String, String>;
            return MaterialPageRoute(
              builder: (context) => AssessmentPage(
                testId: args['testId']!,
                lessonId: args['lessonId']!,
              ),
            );
          case '/rewards':
            return MaterialPageRoute(builder: (context) => const RewardsPage());
          default:
            return null;
        }
      },
    );
  }
}
